import { Section, Stack } from 'tgui-core/components';

import { useBackend } from '../backend';
import { Window } from '../layouts';
import { Rules } from './AntagInfoRules'; // BUBBER EDIT ADDITION
import { type Objective, ObjectivePrintout } from './common/Objectives';

type Info = {
  antag_name: string;
  objectives: Objective[];
  pistols: boolean;
  belt: boolean;
};

// SKYRAT EDIT increase height from 250 to 500
export const AntagInfoHatred = (props) => {
  const { data } = useBackend<Info>();
  const { antag_name, objectives } = data;
  return (
    <Window width={620} height={500}>
      <Window.Content>
        <Section scrollable fill>
          <Stack vertical>
            <Stack.Item textColor="red" fontSize="20px">
              You are the {antag_name}!
            </Stack.Item>
            {/* SKYRAT EDIT ADDITION START */}
            <Stack.Item>
              <Rules />
            </Stack.Item>
            {/* SKYRAT EDIT ADDITION END */}
            <Stack.Item>
              <ObjectivePrintout objectives={objectives} />
            </Stack.Item>
            <Stack.Item>
              <Section fill>
                Ты - <span style={{color: '#ff0000', fontWeight: 'bold'}}>Безымянный Массшутер</span>. Твое имя совершенно неважно. Твое прошлое даже если и было, оно было незавидным.
	              <br />Ты испытываешь непреодолимую ненависть, отвращение и презрение ко всем окружающим.
	              <br />У тебя лишь две цели: <u>убивать</u> и <u>умереть славной смертью</u>.
	              <br />Твое проклятое снаряжение неразлучно с тобою и подстегивает тебя продолжать соврешать геноцид беззащитных гражданских.
	              <br />Твоё <span style={{color: '#ff0000'}}>Оружие Ненависти</span> и неутолимая жажда убивать вознаграждают тебя, ибо завершающий выстрел в упор в голову (рот) исцеляет твои раны, нож добивает быстрее и надежнее.
	              <br /><span style={{color: '#ff0000'}}>Обычная медицина бессильна, а чужое оружие бесполезно для тебя.</span>
                <PistolsInfo />
                <BeltInfo />
	              <br /><span style={{color: '#ff0000', fontWeight: 'bold'}}>Убивай и будь убит!</span> Ибо никто сегодня не защищен от твоей Ненависти.
              </Section>
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};

const PistolsInfo = (props) => {
  const { data } = useBackend<Info>();
  const { pistols } = data;
  if (pistols) {
    return (
      <Section fill>
        <span style={{color: '#ff0000'}}>Кобура Ненависти</span> всегда готова предоставить тебе особое парное оружие. <span style={{color: '#ff0000'}}>Стрелять с двух рук - в Харме</span>. После использования можешь просто выбросить их, ибо их цель была выполнена.
      </Section>
    );
  }
  return (
    <Section fill>
      <span style={{color: '#ff0000'}}>Cумка для патронов</span> сама пополняет пустые магазины/картриджи/клипсы для твоего оружия. Никогда не выбрасывай их!
    </Section>
  )
};

const BeltInfo = (props) => {
  const { data } = useBackend<Info>();
  const { belt } = data;
  if (belt) {
    return (
      <Section fill>
        <span style={{color: '#ff0000'}}>Пояс с гранатами</span> пожирает сердца твоих жертв после их добивания и вознаграждает тебя новой взрывоопасной аммуницией.
      </Section>
    );
  }
};
