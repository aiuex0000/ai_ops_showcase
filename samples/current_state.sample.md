# Current State Sample

この sample は、state stack のうち `今どこにいるか` を短く保つためのノート例です。個人的な気分日記ではなく、作業再開に必要な最小情報だけを置きます。

## Freshness Rule

- 同日かつ直近 6 時間以内なら主参照
- それ以外は参考値
- stale の時は `recent_context.md` や `project_state.md` を補助参照する

## Baseline

- Updated At: `2026-04-21 11:20 +09:00`
- Source: current conversation, changed files, daily notes

## Current State

- Main Topic: AI operations showcase の整理
- Work Mode: 設計と公開向け再編集
- Active Tasks:
  - 入口設計の sample 抜粋
  - state / archive / guardrail の説明整理
  - 公開向け sanitization ルールの固定
- Next Step:
  - showcase 用 sample を追加する
  - index から辿れる状態にする

## Notes

- ここには長い経緯を書かない
- 流れは `Recent Context` に逃がす
- 案件 phase は `Project State` に逃がす

## What We Learned In Practice

- state note を便利メモとして使い始めると、日報や雑多な記録まで流れ込みやすい
- そうなると `現在地キャッシュ` ではなく `長文ログ` になってしまい、再起動時に読むコストが上がる

そのため、state note は `今どこにいるか` と `次の一手` に絞り、経緯は別レイヤーへ逃がす方針が安定します。

## Why This Shape

state note は、その場の全文記録ではなく **再開用キャッシュ** として保つと扱いやすくなります。長い経緯を抱え込まないほうが、次回起動時に読むコストを抑えられます。
