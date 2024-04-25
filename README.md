# manatoki

A new Flutter project.

## Getting Started

## 설명
- 커스터마이징 해서 쓰고싶어서 만드는 PC 앱

### 현재 진행 사항 (4/26)
- 만화 사이트의 '최신화'에 해당하는 url에 접근하여 썸네일과 만화에 대한 url을 추출함
### 직면 했던 문제와 학습 내용들
- 웹에서는 url을 통해 데이터를 요청 (즉 만화에 대한 정보는 url을 통해 가져오면 된다.)
- flutter의 dev.pub에 존재하는 `html` 패키지는, `brotli`압축 방식을 지원하지 않아서 decoding 문제가 발생했다. 해당 사항은 `brotli` 패키지를 통해 별도로 decoding하고, 그 이외의 압축 방식을 `Accept-Encoding`에서 제외하여 해결하였다.
- 사이트에 대한 분석은 브라우저에서 제공하는 DevTool(F12)를 활용하면 되며, 'Network'부분에서 많은 데이터를 얻을 수 있다.
- JQuery는 검색 라이브러리가 아니라, JavaScript의 사용성을 높여주는 라이브러리 였다.
- 참고 사이트 [Flutter에서 HTML에 접근하는 기초적인 방법을 배운 곳](https://gigas-blog.tistory.com/282), [Selector 사용법을 익히기에 좋았던 사이트](https://scrapfly.io/web-scraping-tools/css-xpath-tester), [Selectors-4레벨이 지원하는 것들](https://drafts.csswg.org/selectors-4/)

## TODO
- 업데이트된 만화 페이지
- 만화 보는 페이지
- 북마크
- 로그인
- 검색


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# manatoki-viewer
