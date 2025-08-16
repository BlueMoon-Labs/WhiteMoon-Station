export const TGUI_PANEL_EMOTE_TYPE_DEFAULT = 1
export const TGUI_PANEL_EMOTE_TYPE_CUSTOM = 2
export const TGUI_PANEL_EMOTE_TYPE_ME = 3

export enum EmoteType {
  TGUI_PANEL_EMOTE_TYPE_DEFAULT = 1,
  TGUI_PANEL_EMOTE_TYPE_CUSTOM = 2,
  TGUI_PANEL_EMOTE_TYPE_ME = 3,
  TGUI_PANEL_EMOTE_TYPE_BROKEN = -999
}

export interface Emote {
  name: string;
  type: EmoteType,
  data: EmoteDataDefault | EmoteDataCustom | EmoteDataMe
}

export interface EmoteDataDefault {
  key: string;
}

export interface EmoteDataCustom {
  key: string;
  message_override: string;
}

export interface EmoteDataMe {
  message: string;
}
