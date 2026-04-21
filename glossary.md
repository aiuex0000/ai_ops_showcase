# Glossary

この用語集は、Web 制作は分かるが AI 運用の裏側には詳しくない人向けに、showcase 内のキーワードを短く説明するためのものです。

## Entrypoints

AI をどこから起動し、最初に何を読ませるかを決める入口ファイルです。  
長文の本文を全部抱える場所ではなく、`最初にどこへ戻すか` を決める薄い導線として使います。  
この repo では `AGENTS.md` やツール別 instructions が該当します。

## Source of Truth

長文ルール、定型手順、メモリなどの **正本** です。  
入口よりも変化が多く、実際に参照される本文をここへ寄せます。  
この repo では `.agent/.rules` `.agent/skills` `.agent/workflows` などが中心です。

## Runtime Surface

AI や IDE が実行時に参照する互換レイヤーや live surface です。  
便利ですが、正本そのものではないため、source-of-truth と混ぜないことが重要です。  
この repo では `.agents/` がその代表です。

## Skills

繰り返し使う作業を、再利用しやすい単位にしたものです。  
ルール本文ではなく、`こういう時はこの手順を呼ぶ` ための作業ショートカットとして使います。  
この repo では自作 Skill と generic skill を併用しています。

## Workflows

日報、状態同期、調査レーン分離のような、繰り返し手順の型です。  
Skill より長めで、複数の入力や手順を束ねる場面に向いています。  
この repo では `.agent/workflows/` に置いています。

## State Stack

`今どこにいるか` と `どういう流れで今に来たか` を、短いノートで持つ考え方です。  
長文ログを毎回読み直さなくても、再開や引き継ぎをしやすくします。  
この repo では `Current State` `Recent Context` `Project State` の考え方で使っています。

## Archive

会話ログや作業ログを、後から戻れる根拠として保存する層です。  
live state の代わりではなく、必要な時だけ参照する `戻り先` として使います。  
この repo では `Obsidian/AI/` がその役目を持っています。

## Guardrails

入口、archive、state、tmp、hook などの壊れやすい場所を点検する小さな検査です。  
都度人手で確認する代わりに、`何が崩れていないか` を素早く見るために使います。  
この repo では `check:workspace` 系がその集約入口です。

## Dedicated Agent

役割、口調、参照先、読み順、禁止事項を固定した AI の運用単位です。  
単なるキャラクター設定ではなく、毎回の立ち上がりや引き継ぎ精度をそろえるための設計として機能します。  
この repo では入口、正本、Skill、workflow がこの考え方に沿って組まれています。
