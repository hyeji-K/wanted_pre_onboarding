# wanted_pre_onboarding

<div align="center">

![Swift](https://img.shields.io/badge/Swift-F05138?logo=swift&logoColor=white) ![Xcode](https://img.shields.io/badge/Xcode-blue?logo=xcode&logoColor=white) ![API](https://img.shields.io/badge/OpenWeatherAPI-black?logoColor=white)

</div align="center">

<br>

## 날씨 정보 앱
한국의 20개 도시의 현재 날씨와 현재 날씨의 상세 내용을 확인할 수 있는 앱입니다.

<br>

## 동작 화면
| ![](https://github.com/hyeji-K/wanted_pre_onboarding/blob/main/Screenshots/Launch%ED%99%94%EB%A9%B4.png) | ![](https://github.com/hyeji-K/wanted_pre_onboarding/blob/main/Screenshots/%EB%8F%84%EC%8B%9C%EB%A6%AC%EC%8A%A4%ED%8A%B8%ED%99%94%EB%A9%B4.png) | ![](https://github.com/hyeji-K/wanted_pre_onboarding/blob/main/Screenshots/%EB%82%A0%EC%94%A8%EC%83%81%EC%84%B8%EC%A0%95%EB%B3%B4%ED%99%94%EB%A9%B4.png) |
| :-:| :-: | :-: |
| `Launch 화면` | `날씨 리스트 화면` | `날씨 상세 정보 화면` |

<br>

## 주요 기능
- Open Weather API를 이용하여 날씨 정보를 가져옵니다.
- AutoLayout을 사용했습니다.

### 날씨 리스트 화면
- 20개 도시의 현재 날씨를 확인할 수 있습니다.
- CollectionView를 이용하여 구현하였습니다.

### 날씨 상세 정보 화면
- 리스트 화면에서 각 도시 정보를 클릭하면 클릭한 도시에 대한 상세 날씨를 확인할 수 있습니다.
- NSCache를 이용해 날씨 아이콘 이미지를 불러올때 캐시를 활용합니다.



