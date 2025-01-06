document.addEventListener('DOMContentLoaded', () => {
    // DOM要素を取得
    const timeIntervalSelect = document.getElementById('time-interval');
    const startTimeInput = document.getElementById('start-time');
    const endTimeInput = document.getElementById('end-time');

    // バックエンドから設定を取得
    fetch('http://localhost:3000/settings') // エンドポイントのURLを指定
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        })
        .then(settings => {
            // 時間間隔の選択肢を初期化
            Array.from(timeIntervalSelect.options).forEach(option => {
                if (parseInt(option.value) === settings.time_interval) {
                    option.selected = true;
                }
            });

            // 開始時間と終了時間を初期化
            startTimeInput.value = settings.start_time;
            endTimeInput.value = settings.end_time;
        })
        .catch(error => {
            console.error('Error fetching settings:', error);
            alert('設定の取得に失敗しました。デフォルト値を使用します。');
        });

    // 保存ボタンの動作
    document.getElementById('save-settings').addEventListener('click', () => {
        const selectedInterval = timeIntervalSelect.value;
        const selectedStartTime = startTimeInput.value;
        const selectedEndTime = endTimeInput.value;

        console.log('保存内容:');
        console.log(`時間間隔: ${selectedInterval}分`);
        console.log(`開始時間: ${selectedStartTime}`);
        console.log(`終了時間: ${selectedEndTime}`);

        // 必要に応じてバックエンドに保存リクエストを送信
    });
});
