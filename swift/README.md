# Tutorial for building tableview using swift

## Outline of iOS TableView
- 테이블 뷰는 사용자에게 목록 형식으로 데이터를 표시하는 뷰
- UIKit Framework의 UITableView 클래스를 사용
- 데이터를 행(row)에 표시, 각 행의 내용은 UITableViewCell 객체의 형태로 구현
- 셀의 커스터 마이징은 셀에 서브뷰를 추가하거나 UITableViewCell을 SubClassing하여 구현

## Static Table View vs Dynamic Table View
- Static Table View
  - 고정된 개수의 행들을 테이블에 표시
  - Ex) iOS Setting Application
- Dynamic Table View
  - 가변적인 개수의 행들을 표시
  - Prototype 기반 테이블
  
## TableView Delegate && DataSource
- 테이블 뷰는 델리게이트(delegate)와 연관된 데이터소스(DataSource)를 가짐
- TableView DataSource는 UITableViewDataSource 프로토콜을 구현
  - 타이틀 정보를 정의하는 함수
  - 몇 개의 데이터를 표시할지를 결정하는 함수
  - 몇 개의 영역으로 나뉘는지 결정하는 함수
  - 표시될 셀 객체를 테이블 뷰에 제공하는 함수
- TableView Delegate는 UITableViewDelegate 프로토콜을 구현
  - 표시되는 모습에 대한 제어
  - 사용자의 터치에 대한 인식
  - 행의 높이
  - 들여쓰기
  - 행 삭제 및 수정