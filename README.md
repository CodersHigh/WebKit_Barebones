# WebKit_Barebones
<br/>

### 프로젝트 소개
- WebKit의 기본적인 기능 구현을 익히는 데에 도움을 주는 Bare-bones 프로젝트입니다.
- WebKit을 통해 **SwiftUI 기반의 웹 브라우징 앱**을 구현합니다.
- WebKit을 처음 활용해 보는 경우, 이 프로젝트의 코드를 살펴보면 도움이 됩니다.


https://user-images.githubusercontent.com/74223246/182499513-c6e6db05-2399-4016-a311-0965c7cc726d.MP4

<br/>
<br/>

### WebKit이란?   
<img width="350" alt="WebKitImage" src="https://user-images.githubusercontent.com/74223246/182499612-5a83902b-e895-42ab-ae52-fea015d30219.png">

WebKit은 풍부한 스타일의 **웹 콘텐츠를 앱의 기본 콘텐츠에 통합할 수 있게 해주는 프레임워크**입니다.     
웹 콘텐츠를 페이지 간 탐색할 수도 있고, 최근 방문한 페이지의 목록을 관리해 줍니다.     
이에 따라 웹 콘텐츠를 뒤로 또는 앞으로 탐색할 수 있게 되며, 페이지 새로고침을 할 수도 있죠.   

WebKit에 대해 더 궁금하다면 [Apple의 공식 문서](https://developer.apple.com/documentation/webkit)를 참고해 보세요. 

<br/>
<br/>

### 핵심 코드
WKWebView를 띄우고, 웹 콘텐츠를 탐색 및 새로고침하는 핵심 코드를 참고하세요. 

```Swift
// 웹 뷰생성 
func makeUIView(context: Context) -> WKWebView {
    let view = WKWebView()
    return view
}
```
```Swift
// 웹 뷰 업데이트
func updateUIView(_ uiView: WKWebView, context: Context) {
        
    // 검색 버튼을 눌렀을 때, 해당 url로 이동
    if viewModel.goToPage {
        uiView.load(URLRequest(url: URL(string: viewModel.pageURLString)!))
        viewModel.goToPage = false
    }
        
    // 뒤로 가기
    if viewModel.goBack {
        uiView.goBack()
        viewModel.goBack = false
    }
        
    // 앞으로 가기
    if viewModel.goForward {
        uiView.goForward()
        viewModel.goForward = false
    }
        
    // 새로고침
    if viewModel.reload {
        uiView.reload()
        viewModel.reload = false
    }
        
}
```
