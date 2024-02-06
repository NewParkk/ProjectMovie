        function addBooking(movieTitle, theater, date, time, amount, status) {
            var table = document.getElementById("booking-list");
            var newRow = document.createElement("tr");
            newRow.innerHTML = "<td>" + movieTitle + "</td>" +
                               "<td>" + theater + "</td>" +
                               "<td>" + date + "</td>" +
                               "<td>" + time + "</td>" +
                               "<td>" + amount + "</td>" +
                               "<td>" + status + "</td>";


            newRow.className = table.rows.length % 2 === 0 ? "even" : "odd";

            table.appendChild(newRow);
        }

        // 예매 내역을 추가합니다.
        addBooking("영화 제목 1", "극장 1", "날짜 1", "시간 1", "금액 1", "상태 1");
        addBooking("영화 제목 2", "극장 2", "날짜 2", "시간 2", "금액 2", "상태 2");
         addBooking("영화 제목 3", "극장 3", "날짜 3", "시간 3", "금액 3", "상태 3");
          addBooking("영화 제목 4", "극장 4", "날짜 4", "시간 4", "금액 4", "상태 4");
          addBooking("영화 제목 1", "극장 1", "날짜 1", "시간 1", "금액 1", "상태 1");
        addBooking("영화 제목 2", "극장 2", "날짜 2", "시간 2", "금액 2", "상태 2");
         addBooking("영화 제목 3", "극장 3", "날짜 3", "시간 3", "금액 3", "상태 3");
          addBooking("영화 제목 4", "극장 4", "날짜 4", "시간 4", "금액 4", "상태 4");
          addBooking("영화 제목 1", "극장 1", "날짜 1", "시간 1", "금액 1", "상태 1");
        addBooking("영화 제목 2", "극장 2", "날짜 2", "시간 2", "금액 2", "상태 2");
         addBooking("영화 제목 3", "극장 3", "날짜 3", "시간 3", "금액 3", "상태 3");
          addBooking("영화 제목 4", "극장 4", "날짜 4", "시간 4", "금액 4", "상태 4");

        
        
        
        function addReview(movieTitle, content, date, time) {
            var table = document.getElementById("review-list");
            var newRow = document.createElement("tr");
            newRow.innerHTML = "<td>" + movieTitle + "</td>" +
                               "<td>" + content + "</td>" +
                               "<td>" + date + "</td>" +
                               "<td>" + time + "</td>";


            newRow.className = table.rows.length % 2 === 0 ? "even" : "odd";

            table.appendChild(newRow);
        }

        // 리뷰를 추가합니다.
        addReview("영화 제목 1", "리뷰 내용 1", "날짜 1", "시간 1");
        addReview("영화 제목 2", "리뷰 내용 2", "날짜 2", "시간 2");

