from prometheus_client import start_http_server, Counter
import time

# カウンターメトリクスの定義
REQUEST_COUNT = Counter("api_requests_total", "Total API requests")


# メトリクスを更新するサンプル関数
def process_request():
    REQUEST_COUNT.inc()  # カウントを1増加
    print("Request processed")
    time.sleep(1)  # 処理の遅延をシミュレーション


if __name__ == "__main__":
    # Prometheus用のHTTPサーバーをポート8000で開始
    start_http_server(8000)
    print("Prometheus metrics server running on http://localhost:8000/metrics")

    # 無限ループでメトリクスを更新
    while True:
        process_request()
