document.addEventListener('DOMContentLoaded', () => {
    const scheduleList = document.getElementById('schedule-list');

    fetch('http://localhost:3000/schedules')
        .then(response => response.json())
        .then(data => {
            data.forEach(schedule => {
                const listItem = document.createElement('li');
                listItem.textContent = `${schedule.time} - ${schedule.message}`;
                scheduleList.appendChild(listItem);
            });  
        })
        .catch(error => {
            console.error('Error fetching schedules: ', error);
            const errorItem = document.createElement('li');
            errorItem.textContent = 'スケジュールの取得に失敗しました';
            scheduleList.appendChild(errorItem);
        });
});