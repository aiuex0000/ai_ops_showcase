# Workspace Manifest Sample

この sample は、`何が正本で、何が runtime surface か` を分けるための簡易 manifest 例です。

## Basic Policy

- 入口ファイルは薄く保つ
- 長文ルールや workflow は source-of-truth に置く
- runtime surface は正本とは別に扱う
- archive や tmp は guardrail の正本スコープに含めない

## Source of Truth

- `rules/`: 回答方針と安全ルール
- `skills/`: 再利用する手順
- `workflows/`: 繰り返し手順の型
- `state/`: 現在地や流れの短い保持

## Runtime Surface

- IDE instructions
- AI ごとの live config
- exported archive

runtime surface は利用時に参照される層であり、正本そのものではありません。

## What We Learned In Practice

- 正本と runtime surface を同じ場所に置くと、`いま見ているものが source-of-truth なのか` が分かりにくくなる
- 入口ファイルが増えるほど、どのレイヤーを検査対象にするかも曖昧になりやすい

そのため、manifest では `正本` `runtime surface` `除外スコープ` を先に分けておくのが安定します。

## Guardrail Entrypoints

### `AGENTS.md`

- role: `global_bootloader`
- required references:
  - `rules/global.md`
  - `rules/agent.md`
  - `state/current_state.md`

### `copilot_instructions.md`

- role: `tool_specific_entry`
- required references:
  - `AGENTS.md`
  - `rules/`
  - `skills/`

## Excluded Scope

- `archive/**`
- `tmp/**`
- `vendor/**`
- `node_modules/**`

## Why This Shape

manifest を置くと、`入口が正本を参照しているか` をスクリプトで検査しやすくなります。入口ファイルが増えても、責務のずれを追いやすい構成です。
