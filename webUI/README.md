# Ameba Mini 語音 LED 控制台｜新版介面

這個資料夾是獨立保留的網站外觀版本。原本的 `../web` 沒有被取代。

## 執行方式

1. 關閉 Arduino IDE 的序列監控。
2. 雙擊 `start_webUI.cmd`。
3. 保持 CMD 視窗開啟。
4. 使用桌面版 Chrome 或 Edge 開啟：

   `http://localhost:8000/webUI/`

新版與原版使用相同的 Python API、COM3 串口通訊及 AMB82-MINI 韌體。

## 英文語音指令

先在網站右上方的 `LANG` 選擇 `English`，再使用以下短指令：

- `Blue on` / `Blue off`
- `Green on` / `Green off`
- `Lights on` / `Lights off`
- `Blink now`

「開始語音辨識」按下後會持續聆聽，可連續說多個指令；再次按下「停止語音辨識」才會結束。

「語音回覆」預設開啟，板卡確認指令後由 Python 呼叫 Windows 內建語音播報結果。播報時辨識會暫停，播報完成後自動恢復。
