# pagination
* 많은 데이터 List가 select 되었을때 전체 list를 한화면에 보여주면 
보는데 상당히 에로사항이 있을 것이다
* 한 화면에 일정 List의 분량만 보여주고
* list 하단에 page navigation을 표현하여
* page num를 클릭하면 이후 list를 조회하여 보여주는 방식

## pagination 설계할때 요구사항
* 한 화면에 몇개의 list를 보여줄 것인가 : 보통 10개정도 list를 보여준다
* page nation의 개수를 몇개로 할것인가