// 날짜 포맷 정규식 (yyyy-mm-dd)
const regexDate = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
// date 객체 만들기
const thisDate = new Date();
// 오늘 날짜 (yyyy-mm-dd 00:00:00)
const today = new Date();
// 달력이도 최대 개월 수
const limitMonth = 6;
// 달력에서 표기하는 날짜 객체
let thisMonth = today;
// 달력에서 표기하는 년
let currentYear = thisMonth.getFullYear();
// 달력에서 표기하는 월
let currentMonth = thisMonth.getMonth();
// 체크인 날짜
let checkInDate = "";
// 체크아웃 날짜
let checkOutDate = "";

$(document).ready(function () {
    // 달력 만들기
    calendarInit(thisMonth);

    // 이전달로 이동
    $('.go-prev').on('click', function () {
        const startDate = $('.start-year-month').html().split('.');

        // 달력이 현재 년 월 보다 같거나 작을경우 뒤로가기 막기
        if (getLimitMonthCheck(parseInt(startDate[0]), parseInt(startDate[1])) <= 0) {
            return;
        }

        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        calendarInit(thisMonth);
    });

    // 다음달로 이동
    $('.go-next').on('click', function () {
        const lastDate = $('.last-year-month').html().split('.');

        // 예약 가능 최대 개월수와 같거나 크다면 다음달 이동 막기
        if (getLimitMonthCheck(parseInt(lastDate[0]), parseInt(lastDate[1])) >= limitMonth) {
            alert('최대예약 기간은 ' + limitMonth + '개월 입니다.');
            return;
        }

        let limitYear = today.getFullYear();
        if (currentMonth + limitMonth >= 12) {
            limitYear = limitYear + 1
        }

        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        calendarInit(thisMonth);
    });
});


// 달력 그리기
function calendarInit(thisMonth) {
    // 렌더링을 위한 데이터 정리
    currentYear = thisMonth.getFullYear();
    currentMonth = thisMonth.getMonth();

    // 렌더링 html 요소 생성
    let start_calendar = '';
    let last_calendar = '';

    makeStartCalendar();
    makeLastCalendar();
    
    ///////////////  예약된 날짜 표시
    addClassDisable()
    
    // start_calendar
    function makeStartCalendar() {
        // 전 달의 마지막 날 날짜와 요일 구하기
        const startDay = new Date(currentYear, currentMonth, 0);
        const prevDate = startDay.getDate();
        const prevDay = startDay.getDay();

        // 이번 달의 마지막날 날짜와 요일 구하기
        const endDay = new Date(currentYear, currentMonth + 1, 0);
        const nextDate = endDay.getDate();
        const nextDay = endDay.getDay();

        // 지난달
        for (let i = prevDate - prevDay; i <= prevDate; i++) {
            start_calendar += pervDisableDay(i);
        }

        // 이번달
        for (let i = 1; i <= nextDate; i++) {
            // 이번달이 현재 년도와 월이 같을경우
            if (currentYear === today.getFullYear() && currentMonth === today.getMonth()) {
                // 지난 날짜는 disable 처리
                if (i < today.getDate()) {
                    start_calendar += pervDisableDay(i)
                } else {
                    start_calendar += dailyDay(currentYear, currentMonth, i);
                }
            } else {
                start_calendar += dailyDay(currentYear, currentMonth, i);
            }
        }

        // 다음달 7 일 표시
        for (let i = 1; i <= (6 - nextDay); i++) {
            start_calendar += nextDisableDay(i);
        }

        $('.start-calendar').html(start_calendar);
        // 월 표기
        $('.start-year-month').text(currentYear + '.' + zf((currentMonth + 1)));
    }

    // last_calendar
    function makeLastCalendar() {
        let tempCurrentYear = currentYear;
        let tempCurrentMonth = currentMonth + 1;

        if (tempCurrentMonth >= 12) {
            tempCurrentYear = parseInt(tempCurrentYear) + 1;
            tempCurrentMonth = 0;
        }

        // 이전 달의 마지막 날 날짜와 요일 구하기
        const startDay = new Date(tempCurrentYear, tempCurrentMonth, 0);
        const prevDate = startDay.getDate();
        const prevDay = startDay.getDay();

        // 이번 달의 마지막날 날짜와 요일 구하기
        const endDay = new Date(tempCurrentYear, tempCurrentMonth + 1, 0);
        const nextDate = endDay.getDate();
        const nextDay = endDay.getDay();

        // 지난달
        for (let i = prevDate - prevDay; i <= prevDate; i++) {
            last_calendar += pervDisableDay(i);
        }

        // 이번달
        for (let i = 1; i <= nextDate; i++) {
            // 이번달이 현재 년도와 월이 같을경우
            if (tempCurrentYear === today.getFullYear() && tempCurrentMonth === today.getMonth()) {
                // 지난 날짜는 disable 처리
                if (i < today.getDate()) {
                    last_calendar += pervDisableDay(i)
                } else {
                    last_calendar += dailyDay(tempCurrentYear, tempCurrentMonth, i);
                }
            } else {
                last_calendar += dailyDay(tempCurrentYear, tempCurrentMonth, i);
            }
        }

        // 다음달 7 일 표시
        for (let i = 1; i <= (6 - nextDay); i++) {
            last_calendar += nextDisableDay(i);
        }

        $('.last-calendar').html(last_calendar);
        // 월 표기
        $('.last-year-month').text(tempCurrentYear + '.' + zf((tempCurrentMonth + 1)));
    }


    // 지난달 미리 보기
    function pervDisableDay(day) {
        return '<div class="day prev disable">' + day + '</div>';
    }

    // 이번달
    function dailyDay(currentYear, currentMonth, day) {
    	let indateData = $('.indateData').html();
        // indateData = indateData.toString();
        // let i = indateData.substring('0', '4') + indateData.substring('5', '7') + indateData.substring('8', '10');
    	let outdateData = $('.outdateData').html();
        // outdateData = outdateData.toString();
        // let o = outdateData.substring('0', '4') + outdateData.substring('5', '7') + outdateData.substring('8', '10');
        const date = currentYear + '' + zf((currentMonth + 1)) + '' + zf(day);

        if (checkInDate === date) {
            return '<div class="day current checkIn" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p>' + '</div>';
        } else if (checkOutDate === date) {
            return '<div class="day current checkOut" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p>' + '</div>';
        } else {
            return '<div class="day current" data-day="' + date + '" onclick="selectDay(this)"><span>' + day + '</span><p class="check_in_out_p"></p><p>' + '</div>';
        }
    }

    // 다음달 미리 보기
    function nextDisableDay(day) {
        return '<div class="day next disable">' + day + '</div>';
    }

    addClassSelectDay();
}


// 체크인 체크아웃 기간 안에 날짜 선택 처리
function addClassSelectDay() {
    if (checkInDate !== "" && checkOutDate != "") {
		// 기존 예약 데이터 가져오기
		let indateData = $('.indateData').text().split(' ');
	    let outdateData = $('.outdateData').text().split(' ');
	    
	    // for문에서 이용할 데이터 배열 크기
	    let indateDataL = indateData.length;
	    // 예약날 각각 자르기, - 제거
	    indateData = String(indateData).replaceAll('-', '').split(',');
	    outdateData = String(outdateData).replaceAll('-', '').split(',');
	    
	    // 예약 가능 여부 변수
	    let reservationOk = 1;
	    
	    // 체크인이 기존입실일보다 작고 체크아웃이 기존퇴실일보다 크면  거부
	    for(let i=0 ; i<=indateDataL ; i++){
	    	if ( checkInDate <= indateData[i] && checkOutDate >= outdateData[i]) {
	    		reservationOk = 0;
	    		alert('예약 불가일을 포함 할 수 없습니다.');
	    		$('#check_in_day').html('');
	    		$('#check_out_day').html('');
	    		break;
	    	}
	    }
	    if(reservationOk === 1 ){
	    	$('.day').each(function () {
		            const data_day = $(this).data('day');
		            
		            if (data_day !== undefined && data_day >= checkInDate && data_day <= checkOutDate) {
		                $(this).addClass('selectDay');
		            };
		        });
		        $('.checkIn').find('.check_in_out_p').html('체크인');
		        $('.checkOut').find('.check_in_out_p').html('체크아웃');
		        $('input[name=indate]').attr('value', getCheckIndateHtml_input());
		        $('input[name=outdate]').attr('value', getCheckOutdateHtml_input());
	    }
	    
	   
    }
}

// 달력 날짜 클릭
function selectDay(obj) {
    if (checkInDate === "") {
        $(obj).addClass('checkIn');
        $('.checkIn').find('.check_in_out_p').html('체크인');

        checkInDate = $(obj).data('day');
        
        $('#check_in_day').html(getCheckIndateHtml());
		
        lastCheckInDate();
        
    } else {
        // 체크인 날짜를 한번더 클릭했을때 체크 아웃 되지 않기
        if (parseInt(checkInDate) === $(obj).data('day')) {
            return;
        }

        // 체크인 날짜보다 체크아웃 날짜를 더 앞으로 찍었을경우 체크인 날짜와 체크아웃 날짜를 바꿔준다
        if (checkOutDate === "" && parseInt(checkInDate) > $(obj).data('day')) {
            $('.checkIn').find('.check_in_out_p').html('');
            $('.day').removeClass('checkIn');
            $('#check_in_day').html("");

            checkOutDate = checkInDate
            checkInDate = $(obj).data('day');

            $(obj).addClass('checkIn');
            $('.checkIn').find('.check_in_out_p').html('체크인');

            $('.day[data-day="' + checkOutDate + '"]').addClass('checkOut');
            $('.checkOut').find('.check_in_out_p').html('체크아웃');

            $('#check_in_day').html(getCheckIndateHtml());
            $('#check_out_day').html(getCheckOutdateHtml());
			
            addClassSelectDay();

            return;
        }

        // 체크아웃
        if (checkOutDate === "") {
            $(obj).addClass('checkOut');
            $('.checkOut').find('.check_in_out_p').html('체크아웃');

            checkOutDate = $(obj).data('day');

            $('#check_out_day').html(getCheckOutdateHtml());

            addClassSelectDay();
        } else {
            // 체크아웃을 날짜 까지 지정했지만 체크인 날짜를 변경할 경우
            // if (confirm('체크인 날짜를 변경 하시겠습니까?')) {
                $('.checkIn').find('.check_in_out_p').html('');
                $('.checkOut').find('.check_in_out_p').html('');

                $('.day').removeClass('checkIn');
                $('.day').removeClass('checkOut');
                $('.day').removeClass('selectDay');

                $(obj).addClass('checkIn');
                $('.checkIn').find('.check_in_out_p').html('체크인');

                checkInDate = $(obj).data('day');
                checkOutDate = "";

                $('#check_in_day').html(getCheckIndateHtml());
                $('#check_out_day').html("");
                $('input[name=indate]').attr('value', '');
                $('input[name=outdate]').attr('value', '');

                lastCheckInDate();
            // }
        }
    }
}

// 체크인 날짜 표기
function getCheckIndateHtml() {
    checkInDate = checkInDate.toString();
    return checkInDate.substring('0', '4') + "-" + checkInDate.substring('4', '6') + "-" + checkInDate.substring('6', '8') + " ( " + strWeekDay(weekday(checkInDate)) + " )";
}

// 체크아웃 날짜 표기
function getCheckOutdateHtml() {
    checkOutDate = checkOutDate.toString();
    return checkOutDate.substring('0', '4') + "-" + checkOutDate.substring('4', '6') + "-" + checkOutDate.substring('6', '8') + " ( " + strWeekDay(weekday(checkInDate)) + " )";
}

// 데이터 저장용 체크인 날짜 
function getCheckIndateHtml_input() {
	checkInDate = checkInDate.substring('0', '4') + "-" + checkInDate.substring('4', '6') + "-" + checkInDate.substring('6', '8');
    return checkInDate;
}

// 데이터 저장용 체크아웃 날짜
function getCheckOutdateHtml_input() {
	checkOutDate = checkOutDate.substring('0', '4') + "-" + checkOutDate.substring('4', '6') + "-" + checkOutDate.substring('6', '8');
    return checkOutDate;
}

// 체크인 날짜 클릭시 예약 가능한 마지막 날인지 체크 마지막날 일경우 체크아웃 날짜 자동 선택
function lastCheckInDate() {
    // 날짜 비교를 위해 시간값을 초기화 하기위해 체크인 날짜 다시 셋팅
    let thisCheckDate = new Date(conversion_date(checkInDate, 1));
    thisCheckDate = new Date(thisCheckDate.getFullYear(), thisCheckDate.getMonth(), thisCheckDate.getDate());

    // 예약 가능한 마지막달의 마지막 날짜 셋팅
    let thisLastDate = new Date(today.getFullYear(), ((today.getMonth() + 1) + limitMonth), 0);

    // 체크인 날짜 클릭시 해당일이 예약 가능한 달에 마지막 날짜 일때 체크아웃 강제 표기
    if (thisCheckDate.getTime() === thisLastDate.getTime()) {
        // 체크인 날짜에 하루 더하기
        let thisCheckOutDate = new Date(thisCheckDate.getFullYear(), thisCheckDate.getMonth(), thisCheckDate.getDate());
        thisCheckOutDate.setDate(thisCheckOutDate.getDate() + 1);
        // YYYYMMDD 형태로 변환
        thisCheckOutDate = thisCheckOutDate.getFullYear() + "" + zf((thisCheckOutDate.getMonth() + 1)) + "" + zf(thisCheckOutDate.getDate());

        checkOutDate = thisCheckOutDate;

        $($(".day div[data-day='" + checkOutDate + "']")).addClass('checkOut');

        if ($('.checkOut').find('p').hasClass('holi_day_p')) {
            $('.checkOut').find('.holi_day_p').hide();
        }

        $('.checkOut').find('.check_in_out_p').html('체크아웃');

        $('#check_out_day').html(getCheckOutdateHtml());

        addClassSelectDay();
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// 예약된 날짜 표시 함수
function addClassDisable() {
	// 기존 예약 데이터 가져오기
	let indateData = $('.indateData').text().split(' ');
    let outdateData = $('.outdateData').text().split(' ');
    let indateDataL = indateData.length;
    // 오늘 날짜 구하기
    let y = today.getFullYear();
    let m = today.getMonth()+1;
    let d = today.getDate();
    let onel = y + '' + zf(m) + '' + zf(d);
    
    for(let i=0 ; i<=indateDataL ; i++){
    	indateData = String(indateData).replaceAll('-', '').split(',');
    	outdateData = String(outdateData).replaceAll('-', '').split(',');
    
    if (indateData !== "" && outdateData !== "") {
        $('.day').each(function () {
            const data_day = $(this).data('day');
            
           	// 예약 된 날짜 흐리게, 클릭 이벤트 제거
            if (data_day !== undefined && data_day >= indateData[i] && data_day <= outdateData[i]) {
                $(this).addClass('disable');
                $(this).removeClass('current');
              	$(this).removeAttr('onclick');
            // 당일흐리게, 클릭 이벤트 제거
            }else if(data_day == onel){	 
                $(this).addClass('disable');
                $(this).removeClass('current');
              	$(this).removeAttr('onclick');
            };	// if
        });	// each
    } // if
    } // for
}

// 최대 개월수 체크
function getLimitMonthCheck(year, month) {
    let months = ((today.getFullYear() - year) * 12);
    months -= (today.getMonth() + 1);
    months += month;

    return months;
}

// 날짜형태 변환
function conversion_date(YYMMDD, choice) {
    const yyyy = YYMMDD.substring(0, 4);
    const mm = YYMMDD.substring(4, 6);
    const dd = YYMMDD.substring(6, 8);

    return (choice === 1)
        ? yyyy + "-" + zf(mm) + "-" + zf(dd)
        : yyyy + "." + zf(mm) + "." + zf(dd);
}

// 몇요일인지 알려주는 함수 (숫자 형태)
function weekday(YYYYMMDD) {
    const weekday_year = YYYYMMDD.substring(0, 4);
    const weekday_menth = YYYYMMDD.substring(4, 6);
    const weekday_day = YYYYMMDD.substring(6, 9);

    return new Date(weekday_year + "-" + weekday_menth + "-" + weekday_day).getDay();
}

// 요일 리턴
function strWeekDay(weekday) {
    switch (weekday) {
        case 0: return "일"
            break;
        case 1: return "월"
            break;
        case 2: return "화"
            break;
        case 3: return "수"
            break;
        case 4: return "목"
            break;
        case 5: return "금"
            break;
        case 6: return "토"
            break;
    }
}

// 숫자 두자리로 만들기
function zf(num) {
    num = Number(num).toString();

    if (Number(num) < 10 && num.length == 1) {
        num = "0" + num;
    }

    return num;
}