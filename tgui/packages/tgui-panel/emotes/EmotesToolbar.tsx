import { useState } from 'react';
import { Button, Flex, Section } from 'tgui-core/components';

import { useEmotes } from './hooks';
import { Emote, EmoteDataCustom, EmoteDataDefault, EmoteDataMe, EmoteType } from './model';

const COOLDOWN_DURATION = 1000; // 1 second

export const EmotesToolbar = () => {
  const emotes = useEmotes();
  const [cooldowns, setCooldowns] = useState<Record<string, boolean>>({});

  const BrokenEmote: Emote = {
    name: 'BROKEN',
    type: EmoteType.TGUI_PANEL_EMOTE_TYPE_ME,
    data: {
      message: "С этим эмоутом произошла какая-то ошибка. Увы!"
    }
  }

  const emoteList = Object.entries<{type: EmoteType} & EmoteDataMe & EmoteDataCustom & EmoteDataDefault>(emotes.list || {}).map(
    ([name, {type, key, message_override, message}]): Emote => {
      if (!name) {
        return structuredClone(BrokenEmote)
      }
      switch (type) {
        case EmoteType.TGUI_PANEL_EMOTE_TYPE_DEFAULT: {
          if (key) {
            return {
              name,
              type: EmoteType.TGUI_PANEL_EMOTE_TYPE_DEFAULT,
              data: {
                key
              }
            }
          }
          return structuredClone(BrokenEmote)
        }
        case EmoteType.TGUI_PANEL_EMOTE_TYPE_CUSTOM: {
          if (message_override && key) {
            return {
              name,
              type: EmoteType.TGUI_PANEL_EMOTE_TYPE_CUSTOM,
              data: {
                key,
                message_override
              }
            }
          }
          return structuredClone(BrokenEmote)
        }
        case EmoteType.TGUI_PANEL_EMOTE_TYPE_ME: {
          if (message) {
            return {
              name,
              type: EmoteType.TGUI_PANEL_EMOTE_TYPE_ME,
              data: {
                message
              }
            }
          }
          return structuredClone(BrokenEmote)
        }
        default:
          return structuredClone(BrokenEmote)
      }
    },
  );

  const emoteCreate = () => Byond.sendMessage('emotes/create');

  const emoteExecute = (name: string) => {
    if (cooldowns[name]) {
      return;
    }

    Byond.sendMessage('emotes/execute', {
      name: name,
    });

    setCooldowns((prev) => ({ ...prev, [name]: true }));
    setTimeout(() => {
      setCooldowns((prev) => ({ ...prev, [name]: false }));
    }, COOLDOWN_DURATION);
  };

  const emoteContextAction = (name: string) =>
    Byond.sendMessage('emotes/contextAction', {
      name: name,
    });

  return (
    <Section>
      <Flex align="center" style={{ 'flex-wrap': 'wrap' }}>
        {emoteList
          .sort((a, b) => a.name.localeCompare(b.name))
          .map(emote => {
            let color = "blue";
            let tooltip = "";
            switch (emote.type) {
              case EmoteType.TGUI_PANEL_EMOTE_TYPE_DEFAULT:
                if ("key" in emote.data) {
                  tooltip = `*${emote.data.key}`;
                  break;
                }
                color = "red"
                tooltip = "С этим эмоутом произошла какая-то ошибка. Увы!"
              case EmoteType.TGUI_PANEL_EMOTE_TYPE_CUSTOM:
                if ("key" in emote.data && "message_override" in emote.data) {
                  color = "purple";
                  tooltip = `*${emote.data.key} | \"${emote.data.message_override}\"`;
                  break;
                }
                color = "red"
                tooltip = "С этим эмоутом произошла какая-то ошибка. Увы!"
              case EmoteType.TGUI_PANEL_EMOTE_TYPE_ME:
                if ("message" in emote.data) {
                  color = "orange";
                  tooltip = `\"${emote.data.message}\"`;
                  break;
                }
                color = "red"
                tooltip = "С этим эмоутом произошла какая-то ошибка. Увы!"
                break;
              default:
                color = "red"
                tooltip = "ОШИБКА: НЕИЗВЕСТНЫЙ ТИП ЭМОЦИИ'"
                break;
            }
            return (
              <Flex.Item mx={0.5} mt={1} key={emote.name}>
                <Button
                  content={emote.name}
                  onClick={() => emoteExecute(emote.name)}
                  onContextMenu={(e) => {
                    e.preventDefault();
                    emoteContextAction(emote.name);
                  }}
                  tooltip={tooltip}
                  color = {color}
                  disabled={cooldowns[emote.name]}
                />
              </Flex.Item>
            )
        })}
        <Flex.Item mx={0.5} mt={1}>
          <Button icon="plus" color="green" onClick={() => emoteCreate()} />
        </Flex.Item>
      </Flex>
    </Section>
  );
};
