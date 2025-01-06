document.addEventListener('DOMContentLoaded', () => {
    const dateToday = document.getElementById('date-today');
    const completeRate = document.getElementById('complete-rate');
    const scheduleList = document.getElementById('schedule-list');

    // 設定画面へのリンク
    document.getElementById('settings-link').addEventListener('click', () => {
    window.location.href = '../html/settings.html';
    });

    // 今日のサマリーとスケジュールを取得
    fetch('http://localhost:3000/date_summaries/today')
    .then(response => {
        if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.json();
    })
    .then(data => {
        // 今日の日付と進捗率を表示
        dateToday.textContent = data.date;
        let sunnyCount = 0;
        let allCount = 0;

        // スケジュールリストを初期化
        scheduleList.innerHTML = '';
        
        // スケジュールをリストに追加
        data.schedules.forEach(schedule => {
            const formatedTime = formatTime(schedule.time);  
            sunnyCount = (schedule.weather === 'sunny' ? sunnyCount+1 : sunnyCount);
            console.log(sunnyCount);
            allCount += 1;
            const listItem = document.createElement('li');
            listItem.className = "flex justify-between items-center bg-white p-2 shadow rounded";

            listItem.innerHTML = `
                <div class="flex items-center space-x-2">
                <span class="font-bold">${formatedTime} ~</span>
                <span class="text-gray-700">${schedule.goal || '未設定'}</span>
                </div>
                <div class="flex items-center space-x-2">
                    <img src="../assets/sunny.png" alt="Sunny" class="h-6 w-6 ${schedule.weather === 'sunny' ? '' : 'opacity-25'}">
                    <img src="../assets/cloudy.png" alt="Cloudy" class="h-6 w-6 ${schedule.weather === 'cloudy' ? '' : 'opacity-25'}">
                    <img src="../assets/rainy.png" alt="Rainy" class="h-6 w-6 ${schedule.weather === 'rainy' ? '' : 'opacity-25'}">
                </div>
            `;
            scheduleList.appendChild(listItem);
        });

        const calculatedCompleteRate = sunnyCount / allCount * 100;
        completeRate.textContent = `${calculatedCompleteRate}%`;
    })
    .catch(error => {
        console.error('Error fetching today\'s summary:', error);
        scheduleList.innerHTML = '<li>スケジュールの取得に失敗しました。</li>';
    });
});

function formatTime(isoString) {
    const date = new Date(isoString);
    const hours = date.getHours().toString().padStart(2, '0');
    const minutes = date.getMinutes().toString().padStart(2, '0');
    return `${hours}:${minutes}`;
}