## 🧊 YUMGO: 당신의 냉장고를 더 똑똑하게

**YUMGO**는 냉장고 속 재료를 기반으로 만들 수 있는 레시피를 추천해주는 **Java 기반 웹 애플리케이션**입니다.  
JSP와 서블릿을 활용한 MVC 아키텍처로 구성되어 있으며, 사용자 친화적인 기능을 중심으로 기존 프로젝트를 한층 더 발전시켰습니다.

> [🌐 1차 YUMGO GitHub 프로젝트 바로가기](https://github.com/eunchaipark/YUMGO)

<img width="2400" height="1350" alt="image" src="https://github.com/user-attachments/assets/943fe2e7-2fd8-4a21-bc6b-059e081e67e0" />

## 프로젝트 목적
- 공공데이터를 활용한 실용적인 프로그램 개발
- 자바와 데이터베이스 연동을 통한 백엔드 구조 이해
- DB + 웹 연동으로 사용자 경험 개선
- JSP와 SERVLET을 활용한 MVC구조 이해

## 📁 프로젝트 구조

```
YUMGO-WEB/
├── build/                      # 컴파일된 클래스 파일 저장 디렉터리
│   └── classes/
│       └── com/yumgo/
│           ├── dao/           # DB 접근 DAO 클래스들
│           ├── filter/        # 요청 필터 처리 (예: 언어 설정)
│           ├── handler/       # 각 기능별 요청 처리 핸들러
│           ├── model/         # 데이터 모델 클래스
│           ├── service/       # 비즈니스 로직 처리
│           ├── util/          # 유틸리티 클래스 (DB 연결 등)
│           └── web/           # 서블릿 및 필터 클래스
│
├── src/main/java/com/yumgo/   # Java 소스 코드
│   └── ...                    # 위와 동일한 패키지 구조
│
├── src/main/webapp/           # 웹 리소스 및 JSP 파일
│   ├── resources/img/         # 이미지 리소스
│   ├── WEB-INF/               # 설정 파일 및 JSP 뷰
│   │   ├── lib/               # 외부 라이브러리 JAR
│   │   ├── views/             # JSP 페이지 (기능별 서브폴더 포함)
│   │   ├── web.xml            # 웹 애플리케이션 설정
│   │   └── command.properties # 요청 URL ↔ 핸들러 매핑 설정
│   └── META-INF/              # 메타 정보
```
## 기술 스택 및 시스템 구성
<img width="2400" height="1350" alt="image" src="https://github.com/user-attachments/assets/a3313cda-2944-4609-a687-7482aa8251fe" />


##  핵심 기능 요약

| 구분            | 기능                            | 설명 |
|----------------|---------------------------------|------|
| **사용자 기능** | 회원 등록 / 삭제                | 간단한 회원가입 및 탈퇴 기능 제공 |
|                | 냉장고 재료 관리                | 보유 중인 재료를 추가/삭제하며 유통기한까지 함께 관리 |
|                | 보유 재료 조회                  | 현재 냉장고에 보관 중인 재료 목록 확인 가능 |
|                | 유통기한 지난 재료 자동 폐기     | 유통기한 경과 시 자동으로 폐기 처리 및 `DISCARDED` 테이블에 이관 |
| **레시피 기능** | 재료 기반 레시피 추천            | 사용자가 가진 재료로 만들 수 있는 레시피를 자동 추천 |
|                | 레시피명 기반 재료 조회          | 특정 레시피에 필요한 재료 목록을 출력 |
|                | 레시피 상세 정보 제공            | 조리 시간, 칼로리, 인분 수 등 상세한 정보 제공 |
|                | 외부 자동 검색 기능              | 레시피가 DB에 없을 경우, 키워드 기반으로 외부 웹에서 자동 검색 후 결과 제공 |

---

✅ 위 기능들은 **고령 사용자도 쉽게 접근하고 활용할 수 있도록** 직관적 UI와 자동화된 로직으로 구현되었습니다.

고령 사용자도 손쉽게 사용할 수 있도록 설계된 시스템입니다.



# 아키텍처
<img width="2400" height="1350" alt="image" src="https://github.com/user-attachments/assets/c78f91dd-4546-4faf-8ef4-34051a29dd99" />



# 트러블 슈팅

## 이정원 트러블 슈팅
<img width="2400" height="1350" alt="image" src="https://github.com/user-attachments/assets/5ba6048d-4881-4895-bebb-5bb717f733c9" />

## 권민정 트러블 슈팅
<img width="2400" height="1350" alt="image" src="https://github.com/user-attachments/assets/2d52349e-8311-49c5-b19e-00cacc43b44f" />

## 박은채 트러블 슈팅
<img width="2400" height="1350" alt="image" src="https://github.com/user-attachments/assets/a7c62315-3b4c-4dd9-be62-2f1164ee7643" />



# 느낀점
<img width="2400" height="1350" alt="image" src="https://github.com/user-attachments/assets/64895c1a-6733-4d89-9276-10905ce8cb0c" />
