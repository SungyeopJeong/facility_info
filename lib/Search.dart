import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  void func() async {
    /*CollectionReference facility =
        FirebaseFirestore.instance.collection('facility/category02/category02');
    await facility.add(Facility(
            facilityName: '카이마루(북측 카페테리아)',
            category: '식당',
            operatingTime:
                '1. 조식: 08:00 ~ 09:00 2. 중식: 11:30 ~ 13:30 3. 석식: 17:30 ~ 19:00',
            contactNumber: '042-350-2060',
            location: '학생식당(N11)')
        .toJson());
    await facility.add(Facility(
            facilityName: '서맛골(서측 식당)',
            category: '식당',
            operatingTime: '조식 : 8:00~9:30 중식 : 11:30~14:00 석식 : 17:30~19:00',
            contactNumber: '042-350-2046',
            location: '학생회관-1(W2) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '동맛골(동측 학생식당)',
            category: '식당',
            operatingTime:
                '1. 조식 08:00 ~ 10:00 2. 중식 11:30 ~ 14:00 3. 라면 14:00 ~ 15:30 (평일만 운영) 4. 석식 17:30 ~ 19:00 (코로나로 인해 단축 운영중)',
            contactNumber: '042-350-2043',
            location: '교직원회관(E5) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '동맛골(동측 교직원식당)',
            category: '식당',
            operatingTime: '중식 11:30 ~ 13:30 석식 17:30 ~ 19:00',
            contactNumber: '042-350-2043',
            location: '교직원회관(E5) 2층')
        .toJson());
    await facility.add(Facility(
            facilityName: '교수회관',
            category: '식당',
            operatingTime: '중식: 11:20 ~ 13:30 석식: 17:30 ~ 18:30',
            contactNumber: '042-350-2039',
            location: '교수회관(N6) 1~2층')
        .toJson());
    await facility.add(Facility(
            facilityName: '문지캠퍼스',
            category: '식당',
            operatingTime:
                '조식 : 7시30분~9시 중식 : 라일락,스낵코너 11:00 ~ 13:00 (40분 연장) 석식 : 마로니애 17:00~18:40 (식당 마감시간 19시)',
            contactNumber: '042-350-6727',
            location: '문지캠퍼스 식당동')
        .toJson());
    await facility.add(Facility(
            facilityName: '화암 기숙사 식당',
            category: '식당',
            operatingTime:
                '조식 : 7:30~9:00 중식 : 11:30~13:00 석식 : 17:30~18:40 (식당 마감 시간은 19:00)',
            location: '화암 기숙사')
        .toJson());
    await facility.add(Facility(
            facilityName: '서울캠퍼스 구내 식당',
            category: '식당',
            contactNumber: '02-958-3935',
            location: '서울캠퍼스 복지후생관 2,4층')
        .toJson());
    await facility.add(Facility(
            facilityName: '오늘도 든든',
            category: '식당',
            operatingTime:
                '평일 10:00~19:30 (last order 19:15) [break time 14:30~16:00] / 둘째주, 넷째주 토요일 10:00~14:30 (No break time)',
            contactNumber: '042-350-0891',
            location: '학생식당(N11)')
        .toJson());
    await facility.add(Facility(
            facilityName: '휴김밥전문점',
            category: '식당',
            operatingTime: '평일 08:00~19:30 / 토요일 10:00~14:30 / 일요일 및 공휴일 휴무',
            contactNumber: '042-350-0892',
            location: '학생식당(N11)')
        .toJson());
    await facility.add(Facility(
            facilityName: '리틀하노이',
            category: '식당',
            operatingTime:
                '평일 10:30~19:30 (last order 19:20) [break time 14:30~16:30] / 주말 및 공휴일 휴무',
            location: '학생식당(N11)')
        .toJson());
    await facility.add(Facility(
            facilityName: '캠토',
            category: '식당',
            operatingTime: '평일 09:00~19:00 (break time 없음)',
            contactNumber: '042-350-0872',
            location: '학생식당(N11)')
        .toJson());
    await facility.add(Facility(
            facilityName: '웰차이',
            category: '식당',
            operatingTime:
                '평일 및 토요일 11:00~19:00 (break time 14:30~16:30) / 일요일 및 공휴일 휴무',
            contactNumber: '042-350-0867',
            location: '학생식당(N11)')
        .toJson());
    await facility.add(Facility(
            facilityName: '패컬티 클럽',
            category: '식당',
            operatingTime: '평일 11:20~13:30 (last order 13:30)',
            contactNumber: '042-350-0864',
            location: '교직원회관(E5) 2층')
        .toJson());
    await facility.add(Facility(
            facilityName: '더큰도시락',
            category: '식당',
            operatingTime: '평일 10:00~19:00 / 주말 및 공휴일 휴무',
            contactNumber: '042-350-0875',
            location: '학생회관-1(W2) 2층')
        .toJson());
    CollectionReference facility =
        FirebaseFirestore.instance.collection('facility/category02/category02');
    await facility.add(Facility(
            facilityName: '북측 학생회관 매점',
            category: '매점',
            operatingTime:
                '평일 : 08:00~ (익일) 03:00 / 토요일 : 09:00~24:00 / 일요일 및 공휴일 : 09:00~ (익일) 03:00',
            contactNumber: '042-350-4958',
            location: '학생회관-2(N12)')
        .toJson());
    await facility.add(Facility(
            facilityName: '서측 학생회관 매점',
            category: '매점',
            operatingTime: '평일 : 9:00~19:00 / 주말 및 공휴일 : 휴무',
            contactNumber: '042-350-4954',
            location: '학생회관-1(W2)')
        .toJson());
    await facility.add(Facility(
            facilityName: '교직원회관 매점',
            category: '매점',
            operatingTime: '평일 : 9:00 ~ 19:00 / 주말 및 공휴일 : 휴무',
            contactNumber: '042-350-4955',
            location: '교직원회관(E5)')
        .toJson());
    await facility.add(Facility(
            facilityName: '김병호 IT융합센터 매점',
            category: '매점',
            operatingTime: '평일 : 9:00 ~ 19:00 / 주말 및 공휴일 : 휴무',
            contactNumber: '042-350-0843',
            location: '김병호 · 김삼열 IT 융합빌딩(N1)')
        .toJson());
    await facility.add(Facility(
            facilityName: '세종관 매점',
            category: '매점',
            operatingTime: '평일 : 18:00 ~ (익일) 02:00 / 주말 및 공휴일 : 19:00 ~ 24:00',
            contactNumber: '042-350-4956',
            location: '세종관(E8)')
        .toJson());
    await facility.add(Facility(
            facilityName: '나들/여울관 매점',
            category: '매점',
            operatingTime: '평일 : 18:00 ~ (익일) 02:00 / 주말 및 공휴일 : 19:00 ~ 24:00',
            contactNumber: '042-350-4954',
            location: '나들/여울관(W4)')
        .toJson());
    await facility.add(Facility(
            facilityName: '희망/다솜관 매점',
            category: '매점',
            operatingTime: '평일 : 18:00 ~ (익일) 02:00 / 주말 및 공휴일 : 19:00 ~ 24:00',
            contactNumber: '042-350-4946',
            location: '희망/다솜관(W4-3)')
        .toJson());
    await facility.add(Facility(
            facilityName: '미르/나래관 매점',
            category: '매점',
            operatingTime: '평일 : 18:00 ~ (익일) 02:00 / 주말 및 공휴일 : 19:00 ~ 24:00',
            contactNumber: '042-350-4957',
            location: '미르/나래관(W6)')
        .toJson());
    CollectionReference facility =
        FirebaseFirestore.instance.collection('facility/category03/category03');
    await facility.add(Facility(
            facilityName: '대덕동네 피자(DDDN Pizza)',
            category: '베이커리/패스트푸드',
            operatingTime:
                '평일 11:00 ~ 18:30 / 토요일 및 공휴일 11: 30 ~ 18:00 / 일요일 및 명절 휴무',
            contactNumber: '042-350-4787',
            location: '학생회관-1(W2) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '써브웨이',
            category: '베이커리/패스트푸드',
            operatingTime: '평일 및 주말, 공휴일 08:00 ~ 23:00',
            contactNumber: ' 042-863-7001',
            location: '정문술빌딩(E16)')
        .toJson());
    await facility.add(Facility(
            facilityName: '풀빛마루(PULBITMARU)',
            category: '베이커리/패스트푸드',
            operatingTime:
                '08:30 ~ 18:50(18:30 주문 마감) break time 없음 / 주말 및 공휴일 휴무',
            contactNumber: '042-350-0365',
            location: '학생회관-2(N12) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '오샐러드(Ohh!SALAD)',
            category: '베이커리/패스트푸드',
            operatingTime: '08:00 ~ 20:00 break time 없음 / 주말 10:00 ~ 19:00',
            contactNumber: '070-8648-3599',
            location: '원자력 및 양자공학과(N7-1) 1층')
        .toJson());
    CollectionReference facility =
        FirebaseFirestore.instance.collection('facility/category04/category04');
    await facility.add(Facility(
            facilityName: '그라지에(Grazie)',
            category: '카페',
            operatingTime: '평일 08:30~21:30 / 주말 10:00~19:00',
            contactNumber: '042-350-0896',
            location: 'KI빌딩(E4) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '카페 잇(EAT)',
            category: '카페',
            operatingTime: '평일 09:00~17:00 / 주말 및 공휴일 휴무',
            contactNumber: '042-867-5156',
            location: '인터내셔널센터(W2-1) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '카페드롭탑',
            category: '카페',
            operatingTime: '평일 08:00~21:00 / 공휴일 10:00~21:00 / 주말 휴무',
            contactNumber: '042-350-0890',
            location: '교육지원동(W8) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '카페 오가다',
            category: '카페',
            operatingTime: '평일 10:00~18:00',
            contactNumber: '042-350-0863',
            location: '학술문화관(E9) 2층')
        .toJson());
    await facility.add(Facility(
            facilityName: '스무디킹',
            category: '카페',
            operatingTime: '평일 08:00~21:00 / 주말 10:00~21:00',
            contactNumber: '042-350-0866',
            location: '응용공학동(W1) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '카페드림',
            category: '카페',
            operatingTime: '평일 09:00~20:00 / 토요일 및 공휴일 10:00~18:00 / 일요일 휴무',
            contactNumber: '042-350-0851',
            location: '기계공학동(N7) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '쥬스킹',
            category: '카페',
            operatingTime: '평일 09:30~20:00 / 토요일 11:00~16:00 / 일요일 및 공휴일 휴무',
            contactNumber: '042-350-0855',
            location: '학생식당(N11)')
        .toJson());
    await facility.add(Facility(
            facilityName: '파스쿠찌',
            category: '카페',
            operatingTime: '매일 08:00~23:00',
            contactNumber: '042-863-8497',
            location: '정보전자공학동(E3) 1층')
        .toJson()); 
    CollectionReference facility =
        FirebaseFirestore.instance.collection('facility/category05/category05');
    await facility.add(Facility(
            facilityName: '스포츠 컴플렉스 - 주경기장',
            category: '체육시설',
            operatingTime: '06:00~24:00',
            contactNumber: '042-350-4813, 042-350-4814',
            location: '스포츠 컴플렉스(N3)')
        .toJson());
    await facility.add(Facility(
            facilityName: '스포츠 컴플렉스 - 부대시설',
            category: '체육시설',
            operatingTime: '06:00~24:00',
            contactNumber: '042-350-4813, 042-350-4814',
            location: '스포츠 컴플렉스(N3)')
        .toJson());
    await facility.add(Facility(
            facilityName: '스포츠 컴플렉스 - 회원제(헬스, 골프)',
            category: '체육시설',
            operatingTime: '월~금, 07:00~23:00 / 토요일, 08:00~18:00',
            contactNumber: '042-350-4833',
            location: '스포츠 컴플렉스(N3)')
        .toJson());
    await facility.add(Facility(
            facilityName: '북측 운동장 - 축구, 야구장',
            category: '체육시설',
            operatingTime: '연중(일출~일몰)',
            contactNumber: '042-350-4813, 042-350-4814',
            location: '태울관(N13) 측면')
        .toJson());
    await facility.add(Facility(
            facilityName: '북측 운동장 - 풋살경기장',
            category: '체육시설',
            operatingTime: '연중(일출~22:00)',
            contactNumber: '042-350-4813, 042-350-4814',
            location: '태울관(N13) 측면')
        .toJson());
    await facility.add(Facility(
            facilityName: '북측 운동장 - 족구장',
            category: '체육시설',
            operatingTime: '연중(일출~22:00)',
            contactNumber: '042-350-4813, 042-350-4814',
            location: '태울관(N13) 측면')
        .toJson());
    await facility.add(Facility(
            facilityName: '테니스장 - 교직원 코트',
            category: '체육시설',
            operatingTime: '연중(일출~22:00)',
            location: '교수회관(N6) 옆')
        .toJson());
    await facility.add(Facility(
            facilityName: '테니스장 - 기계동',
            category: '체육시설',
            operatingTime: '연중(일출~22:00)',
            contactNumber: '042-350-4813, 042-350-4814',
            location: '기계공학동(N7) 뒤편')
        .toJson());
    await facility.add(Facility(
            facilityName: '테니스장 - 동측(대운동장)',
            category: '체육시설',
            operatingTime: '연중(일출~22:00)',
            contactNumber: '042-350-4813, 042-350-4814',
            location: '대운동장(E17) 입구')
        .toJson());
    await facility.add(Facility(
            facilityName: '대강당 - 실내수영장',
            category: '체육시설',
            operatingTime: '월~금, 08:00~21:00 / 토요일, 08:00~18:00',
            contactNumber: '042-350-4823, 042-350-4824',
            location: '대강당(E15) 좌측')
        .toJson());
    await facility.add(Facility(
            facilityName: '대강당 - 체력단련실',
            category: '체육시설',
            operatingTime: '월~금, 08:00~21:00 / 토요일, 08:00~18:00',
            contactNumber: '042-350-4823, 042-350-4824',
            location: '대강당(E15) 좌측')
        .toJson());
    await facility.add(Facility(
            facilityName: '동측 운동장 - 축구장(인조)',
            category: '체육시설',
            operatingTime: '연중(일출~22:00)',
            contactNumber: '042-350-4814',
            location: '대운동장(E17)')
        .toJson());
    await facility.add(Facility(
            facilityName: '동측 운동장 - 조깅트랙',
            category: '체육시설',
            operatingTime: '연중',
            contactNumber: '042-350-4814',
            location: '대운동장(E17)')
        .toJson());
    await facility.add(Facility(
            facilityName: '서측 체육관',
            category: '체육시설',
            operatingTime: '06:00~24:00',
            contactNumber: '042-350-4814',
            location: '학생회관-1(W2) 지하')
        .toJson());
    await facility.add(Facility(
            facilityName: '본관 체력단련실', category: '체육시설', location: '본관(E14)')
        .toJson());
    await facility.add(Facility(
            facilityName: '패컬티 클럽 - 스크린골프',
            category: '체육시설',
            location: '교직원회관(E5)')
        .toJson());
    await facility.add(Facility(
            facilityName: '체력단련실 - 신뢰관', category: '체육시설', location: '신뢰관(N20)')
        .toJson());
    await facility.add(Facility(
            facilityName: '체력단련실 - 아름관', category: '체육시설', location: '아름관(N19)')
        .toJson());
    await facility.add(Facility(
            facilityName: '체력단련실 - 세종관', category: '체육시설', location: '세종관(E8)')
        .toJson());
    await facility.add(Facility(
            facilityName: '체력단련실 - 갈릴레이관',
            category: '체육시설',
            location: '갈릴레이관(W3)')
        .toJson());
    await facility.add(Facility(
            facilityName: '체력단련실 - 미르/나래관',
            category: '체육시설',
            location: '미르/나래관(W6)')
        .toJson());
    await facility.add(Facility(
            facilityName: '체력단련실 - 희망/다솜관',
            category: '체육시설',
            location: '희망/다솜관(W4-3)')
        .toJson());
    await facility.add(Facility(
            facilityName: '체력단련실 - 나들/여울관',
            category: '체육시설',
            location: '나들/여울관(W4)')
        .toJson());
    await facility.add(
        Facility(facilityName: '체력단련실 - 화암관', category: '체육시설', location: '화암관')
            .toJson());
    CollectionReference facility =
        FirebaseFirestore.instance.collection('facility/category06/category06');
    await facility.add(Facility(
            facilityName: '인권윤리센터',
            category: '학내 인권 상담 기구',
            contactNumber: '042-350-1004',
            location: '동문창업관(N22) 208호')
        .toJson());
    await facility.add(Facility(
            facilityName: '옴부즈퍼슨',
            category: '학내 인권 상담 기구',
            contactNumber: '042-350-2011',
            location: '본관(E14) 307호')
        .toJson());
    await facility.add(Facility(
            facilityName: '대학원 총학생회 인권센터',
            category: '학내 인권 상담 기구',
            contactNumber: '042-350-0333',
            location: '학생회관-1(W2) 201호')
        .toJson());
    await facility.add(Facility(
            facilityName: '학부 총학생회 학생·소수자인권위원회',
            category: '학내 인권 상담 기구',
            location: '장영신학생회관(N13-1) 205호')
        .toJson());
    await facility.add(Facility(
            facilityName: '상담센터',
            category: '학내 인권 상담 기구',
            contactNumber: '042-350-7952',
            location: '장영신학생회관(N13-1) 3층')
        .toJson());
    await facility.add(Facility(
            facilityName: '스트레스 클리닉',
            category: '학내 인권 상담 기구',
            contactNumber: '042-350-0540',
            location: '카이스트 클리닉(E21)')
        .toJson());
    await facility.add(Facility(
            facilityName: '국제교원 및 학생지원팀(ISSS)',
            category: '학내 인권 상담 기구',
            location: '인터내셔널센터(W2-1) 104호')
        .toJson());
    await facility.add(Facility(
            facilityName: '캠퍼스폴리스',
            category: '학내 인권 상담 기구',
            contactNumber: '042-350-4000',
            location: '교육지원동(W8) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '고객만족센터',
            category: '학내 인권 상담 기구',
            contactNumber: '042-350-1452',
            location: '본관(E14) 414호')
        .toJson());
    CollectionReference facility =
        FirebaseFirestore.instance.collection('facility/category07/category07');
    await facility.add(Facility(
            facilityName: '카이스트 클리닉',
            category: '의료복지시설',
            operatingTime: '오전진료: 9:00 - 12:40 / 오후진료: 14:00 - 17:40',
            contactNumber:
                '042-350-0520, 042-350-0530, 042-350-0535, 042-350-0540, 042-350-0597, 042-350-0504, 042-350-0560, 042-350-0570',
            location: '카이스트 클리닉(E21)',
            extraInfo: '진료과에 따라 진료시간이 다르니 자세한 사항은 카이스트 클리닉 홈페이지 참고')
        .toJson());
    await facility.add(Facility(
            facilityName: '건강관리실',
            category: '의료복지시설',
            operatingTime:
                '평일 (월~금) 9AM ~ 10PM / 주말 (토~일) 10AM ~ 6PM / 점심시간 12~1PM 및 법정공휴일 미운영',
            contactNumber: '042-350-4816, 042-350-4817, 042-350-4818',
            location: '태울관(N13) 2104호')
        .toJson());
    await facility.add(Facility(
            facilityName: '교내약국',
            category: '의료복지시설',
            operatingTime:
                '평일(월~금) 09:00 ~ 18:30 / 주말, 공휴일 휴무 / 점심시간(13:00~14:00)',
            contactNumber: '042-350-0567',
            location: '카이스트 클리닉(E21) 정문 오른쪽')
        .toJson());
    await facility.add(Facility(
            facilityName: 'KAIST 어린이집',
            category: '의료복지시설',
            operatingTime: '월 ~ 금 08:00 ~ 21:30',
            contactNumber: '042-350-0853',
            location: '인터내셔널센터(W2-1) 1층/2층')
        .toJson());
    await facility.add(Facility(
            facilityName: '사이언스 신성 어린이집',
            category: '의료복지시설',
            operatingTime: '월~금(주5일), 07:30~19:30(22:30까지 연장보육 중)',
            contactNumber: '042-864-3177, 042-864-3178, 042-864-3179',
            location: '대전 유성구 과학로 200 / 지하1층, 지상2층')
        .toJson());
    await facility.add(Facility(
            facilityName: '사이언스 대덕 어린이집',
            category: '의료복지시설',
            operatingTime: '월~금(주5일), 07:30~19:30(21:30까지 연장보육 중)',
            contactNumber: '042-863-2231, 042-863-2232',
            location: '대전 유성구 대덕대로 522 / 지상2층')
        .toJson());
    CollectionReference facility =
        FirebaseFirestore.instance.collection('facility/category08/category08');
    await facility.add(Facility(
            facilityName: 'KAIST 기념품 매장',
            category: '기념품매장',
            operatingTime: '평일 오전9시~오후7시, 토요일 오전9시~오후3시 (일요일 및 공휴일은 휴무)',
            contactNumber: '042-862-8005',
            location: '학술문화관(E9) L102-2호')
        .toJson());
    CollectionReference facility =
        FirebaseFirestore.instance.collection('facility/category09/category09');
    await facility.add(Facility(
            facilityName: '오비기획 - 학술문화관',
            category: '인쇄',
            operatingTime: '평일 09:00~18:00 / 토요일, 공휴일 휴무',
            contactNumber: '042-350-2160',
            location: '학술문화관(E9) 4층')
        .toJson());
    await facility.add(Facility(
            facilityName: '오비기획 - 교양분관',
            category: '인쇄',
            operatingTime: '평일 09:00~18:00 / 토요일, 공휴일 휴무',
            contactNumber: '042-350-2180',
            location: '교양분관(N10) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '오비기획 - 응용공학동',
            category: '인쇄',
            operatingTime: '평일 09:30~17:30 / 토요일, 공휴일 휴무',
            contactNumber: '042-350-4724',
            location: '응용공학동(W1) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '오비기획 - 자연과학동',
            category: '인쇄',
            operatingTime: '평일 09:30~17:30 / 토요일, 공휴일 휴무',
            contactNumber: '042-350-4725, 042-867-2160',
            location: '자연과학동(E6) 2층')
        .toJson());
    await facility.add(Facility(
            facilityName: '신진기획인쇄사',
            category: '인쇄',
            operatingTime: '평일 : 09:00~18:00 / 토요일, 공휴일 휴무',
            contactNumber:
                '042-350-4981, 042-350-4982, 042-350-4983, 042-350-4984',
            location: '교육지원동(W8) 1층')
        .toJson());
    CollectionReference facility =
        FirebaseFirestore.instance.collection('facility/category10/category10');
    await facility.add(Facility(
            facilityName: '우리은행',
            category: '은행/우체국/ATM',
            operatingTime: '평일 09:00~16:00 / 토요일, 공휴일 휴무',
            contactNumber: '042-350-3600',
            location: '학생회관-1(W2) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '새마을금고',
            category: '은행/우체국/ATM',
            operatingTime: '평일 09:00~16:00 / 토요일, 공휴일 휴무​',
            contactNumber: '042-350-2600',
            location: '학생회관-1(W2)')
        .toJson());
    await facility.add(Facility(
            facilityName: '우체국',
            category: '은행/우체국/ATM',
            operatingTime: '평일 09:00~18:00 / 토요일, 공휴일 휴무​',
            contactNumber: '042-350-2900',
            location: '학생식당(N11)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 우리은행 점내',
            category: '은행/우체국/ATM',
            operatingTime: '24시간',
            location: '학생회관-1(W2)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 김병호 · 김삼열 IT 융합빌딩',
            category: '은행/우체국/ATM',
            operatingTime: '07:00~23:00',
            location: '김병호 · 김삼열 IT 융합빌딩(N1)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 희망관',
            category: '은행/우체국/ATM',
            operatingTime: '07:00~23:00',
            location: '희망관(W4-4)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 교육지원동',
            category: '은행/우체국/ATM',
            operatingTime: '07:00~23:00',
            location: '교육지원동(W8)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 카이스트 클리닉',
            category: '은행/우체국/ATM',
            operatingTime: '07:00~23:00',
            location: '카이스트 클리닉(E21)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 산업디자인학과동 ',
            category: '은행/우체국/ATM',
            operatingTime: '07:00~23:00',
            location: '산업디자인학과동(N25)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - KAIST 부설 나노종합기술원 ',
            category: '은행/우체국/ATM',
            operatingTime: '07:00~23:00',
            location: 'KAIST 부설 나노종합기술원(E19)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 창의학습관',
            category: '은행/우체국/ATM',
            operatingTime: '07:00~23:00',
            location: '창의학습관(E11)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - KI빌딩',
            category: '은행/우체국/ATM',
            operatingTime: '07:00~23:00',
            location: 'KI빌딩(E4)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 본관',
            category: '은행/우체국/ATM',
            operatingTime: '07:00~23:00',
            location: '본관(E14)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 자연과학동',
            category: '은행/우체국/ATM',
            operatingTime: '07:00~23:00',
            location: '자연과학동(E6)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 산업경영학동',
            category: '은행/우체국/ATM',
            operatingTime: '07:00~23:00',
            location: '산업경영학동(E2)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 정문술빌딩',
            category: '은행/우체국/ATM',
            operatingTime: '07:00~23:00',
            location: '정문술빌딩(E16)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 정보전자공학동',
            category: '은행/우체국/ATM',
            operatingTime: '07:00~23:00',
            location: '정보전자공학동(E3)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 기계공학동',
            category: '은행/우체국/ATM',
            operatingTime: '07:00~23:00',
            location: '기계공학동(N7)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 태울관',
            category: '은행/우체국/ATM',
            operatingTime: '24시간',
            location: '태울관(N13)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 응용공학동',
            category: '은행/우체국/ATM',
            operatingTime: '07:00~23:00',
            location: '응용공학동(W1)')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 문지캠퍼스 본관',
            category: '은행/우체국/ATM',
            operatingTime: '08:00~22:00',
            location: '문지캠퍼스 본관')
        .toJson());
    await facility.add(Facility(
            facilityName: 'ATM - 문지캠퍼스 식당동',
            category: '은행/우체국/ATM',
            operatingTime: '08:00~22:00',
            location: '문지캠퍼스 식당동')
        .toJson());
    CollectionReference facility =
        FirebaseFirestore.instance.collection('facility/category11/category11');
    await facility.add(Facility(
            facilityName: '카이코인노래방',
            category: '기타편의시설',
            operatingTime: '코로나19로 인해 잠정 폐쇄',
            contactNumber: '042-350-0369',
            location: '노천극장(W9) 1층',
            extraInfo: '카이코인 노래방 페이스북 참조')
        .toJson());
    await facility.add(Facility(
            facilityName: '자전거 매장',
            category: '기타편의시설',
            operatingTime: '09:00~19:00(명절 제외 연중무휴)',
            contactNumber: '042-861-0418',
            location: '교양분관(N10) 뒤편')
        .toJson());
    await facility.add(Facility(
            facilityName: '미용실',
            category: '기타편의시설',
            operatingTime: '월~금 09:30 ~ 18:00(토, 일요일 및 공휴일 휴무)',
            contactNumber: '042-350-2061',
            location: '학생회관-1(W2)')
        .toJson());
    await facility.add(Facility(
            facilityName: '이발소',
            category: '기타편의시설',
            operatingTime:
                '월요일~금요일 08:30~18:00 / 토요일 08:30~12:00 / 일요일 및 공휴일 휴무',
            contactNumber: '042-350-2062',
            location: '학생회관-2(N12)')
        .toJson());
    await facility.add(Facility(
            facilityName: '동측 세탁소',
            category: '기타편의시설',
            operatingTime: '월요일~금요일 09:00~18:00',
            contactNumber: '042-350-4936',
            location: '세종관(E8) 세종A관 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '서측 세탁소',
            category: '기타편의시설',
            operatingTime: '월요일~금요일 09:00~18:00',
            contactNumber: '042-350-4939',
            location: '나들관(W4-2) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '북측 세탁소',
            category: '기타편의시설',
            operatingTime: '월요일~금요일 09:00~18:00 / 토요일 09:00~13:00',
            contactNumber: '042-350-4938',
            location: '학생회관-2(N12) 2층')
        .toJson());
    await facility.add(Facility(
            facilityName: '미르 무인세탁소',
            category: '기타편의시설',
            operatingTime: '24시간 운영',
            contactNumber: '042-351-04908',
            location: '미르관(W6) 지하')
        .toJson());
    await facility.add(Facility(
            facilityName: 'KAIST 빨래방',
            category: '기타편의시설',
            operatingTime: '월요일~금요일 07:00~16:00 / 주말 및 공휴일은 휴무',
            contactNumber: '042-350-0391',
            location: '학생회관-1(W2) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '컴퓨터 조립 및 수리',
            category: '기타편의시설',
            operatingTime: '월요일~금요일 09:00~19:00',
            contactNumber: '042-350-2068',
            location: '학생회관-1(W2) 1층')
        .toJson());
    await facility.add(Facility(
            facilityName: '잡화점',
            category: '기타편의시설',
            operatingTime: '평일 09:00~19:00 / 토요일 09:00~15:00 / 일요일, 공휴일 휴무',
            contactNumber: '042-350-4959',
            location: '태울관(N13)')
        .toJson());
    await facility.add(Facility(
            facilityName: '안경점',
            category: '기타편의시설',
            operatingTime: '평일 09:00~19:00 / 토요일 09:00~15:00 / 일요일, 공휴일 휴무',
            contactNumber: '042-350-4948',
            location: '태울관(N13)')
        .toJson());*/
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
        color: Colors.white,
        height: 56,
        padding:
            const EdgeInsets.only(top: 10, left: 16, bottom: 10, right: 16),
        child: GestureDetector(
          onTap: () async {
            //func();
          },
          child: Container(
            width: width - 32,
            padding: const EdgeInsets.only(left: 18),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xffC4C4C4), width: 1)),
            child: const Align(
              alignment: Alignment(-1.0, 0),
              child: ImageIcon(
                AssetImage('assets/image/search_24.png'),
              ),
            ),
          ),
        ));
  }
}
