# 🍺

## 각오
- 10004🐂 : 소처럼 하자.
- Joy🙋🏻‍♀️ : 바쁘다 바빠💦 현대사회에 걸맞게 살겠습니다.

## 마일스톤 정책

- Epic == Milestone => 기록 / 커뮤니티 / 인증
- Story == Issue => 로그인 / 이중보안 / ... / HealthKit을 사용한 유저 활동 정보 객체 개발
- Task == 동작 하나하나 => feature domain의 State와 Action의 정의

## Ground Rule

- **Branch**
    - 브랜치 short description은 기본적으로 FeatureDomain의 이름을 붙인다.
    - 플랫폼 : iOS / iPadOS / WatchOS/ tvOS / macOS
    - {플랫폼}-header-short description
    - 예시 : iOS-feat-login
    - **header**
        - **feat** : 신규 기능 구현 → 사용자를 위한 신 기능; 새로운 빌드 관련 기능은 미포함
        - **fix** : 버그나 에러 수정 → 사용자 버그 수정; 빌드 관련 버그 픽스 미포함
        - **refactor** : 리팩토링 → Production Code ( 비즈니스 로직 ?)의 수정사항; 변수의 이름 변경 포함.
        - **style** : **코드 스타일 수정** → 포멧, 잊어버린 세미 콜론 등; Production Code의 코드 변경이 없음.
        - **docs** : 문서 작업 → 문서의 변경점
        - **test** : 테스트 코드 → 빠진 테스트의 추가, 테스트의 리팩터링; Production Code의 변경 없음
        - **chore** : 그외 기타 → updating grunt tasks etc; Production Code의 변경 없음
        
- **Commit Message**
    - [header] title (#issue number)
    - 예시 : [feat] login feature state 추가 (#5)
    - **header**
        - **feat** : 신규 기능 구현 → 사용자를 위한 신 기능; 새로운 빌드 관련 기능은 미포함
        - **fix** : 버그나 에러 수정 → 사용자 버그 수정; 빌드 관련 버그 픽스 미포함
        - **refactor** : 리팩토링 → Production Code ( 비즈니스 로직 ?)의 수정사항; 변수의 이름 변경 포함.
        - **style** : **코드 스타일 수정** → 포멧, 잊어버린 세미 콜론 등; Production Code의 코드 변경이 없음.
        - **docs** : 문서 작업 → 문서의 변경점
        - **test** : 테스트 코드 → 빠진 테스트의 추가, 테스트의 리팩터링; Production Code의 변경 없음
        - **chore** : 그외 기타 → updating grunt tasks etc; Production Code의 변경 없음
    - **title** or **message**
        - 자주 쓰는 동사 : 추가(Add), 수정(Update), 삭제(Delete)
        [feat] 코인 송금 API 연결 (#31)
        [refactor] Delete plus function from practice/prac03/index.js (#11)
        [style] Add util/Color+Ext (#13)
        [fix] 수정된 코인 모델 속성 이름 적용 (#22)
        [docs] Update README.md (#27)
    - commit message는 알아보기 쉽게!(한글과 영어는 자유롭게)
    - 다만, commit header는 영어로 작성!
    
    
 - **Issue**
    - 플랫폼 : iOS / iPadOS / WatchOS/ tvOS / macOS
    - [플랫폼] {featureDomain} - {구현할 기능 제목}
    - 예시 : [iOS] Login-twoFactor FeatureDomain / [iOS] Login-twoFactor UI
    - **요구사항 제목** or **구현할 기능의 제목**
    - **이슈 제목에 대한 세부 구현 항목**은 반드시 기술하기
    - Assignee == 해당 이슈를 진행할 사람
    - 라벨 지정 → 기본적으로, Feat / Refactor / Fix
    (커스텀 가능)
  
