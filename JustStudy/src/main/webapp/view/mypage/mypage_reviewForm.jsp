<%@ page import="model_p.MemberDTO" %><%--
  Created by IntelliJ IDEA.
  User: dieun
  Date: 2022-08-18
  Time: 오전 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>

    .review-insert-form-items {
        display: flex;
    }

    .review-insert-form-items > p {
        width: 100px;
        height: 40px;
        font-size: 1.2rem;
        line-height: 40px;
    }

    .review-insert-form-items .user-input{
        width: 200px;
        height: 40px;
        border: 0;
        margin-right: 20px;
    }

    .fa-star{
        font-size: 1.5rem;
        line-height: 40px;
        margin-right: 5px;
    }

    .review-insert-form-items .btn-modify{
        width: 100px;
        height: 40px;
        border: 0;
        background: rgb(28, 63, 90);
        color: aliceblue;
    }

    #review-insert-confirm-wrapper {
        width: 400px;
        display: flex;
        align-items: center;
        flex-direction: row;
        justify-content: space-around;
    }

    #review-insert-confirm-wrapper > .btn-modify{
        width:150px;
    }

</style>

<div class="mypage-review-bg">
    <h1>후기 작성</h1>
    <hr>
    <form action="MypageReviewInsert" method="post" class="mypage-review-form">
        <input type="hidden" name="reservId" value="${param.reservId}"/>
        <ul>
            <li class="review-insert-form-items">
                <p>작성자</p>
                <input type="hidden" name="memId" value="<%=((MemberDTO) request.getAttribute("memberDTO")).getMem_id()%>">
                <input type="text" class="user-input" value="<%=((MemberDTO) request.getAttribute("memberDTO")).getMem_nickname()%>" readonly>
            </li>
            <li class="review-insert-form-items">
                <p>지역</p>
                <input type="text" class="user-input" value="${reservationDTO.city}" readonly>
                <p>지점명</p>
                <input type="text" class="user-input" value="${reservationDTO.branch}" readonly>
            </li>
            <li class="review-insert-form-items">
                <p>룸타입</p>
                <input type="text" class="user-input" value="${reservationDTO.room}" readonly>
            </li>
            <li class="review-insert-form-items">
                <p>이용일자</p>
                <input type="text" class="user-input" value="${reservationDTO.useDate}" readonly>
                <p>시간</p>
                <input type="text" class="user-input" value="${reservationDTO.time}" readonly>
            </li>
            <li class="review-insert-form-items">
                <p>별점</p>
                <input type="checkbox" name="reviewStar" hidden/>
                <i class="fa-regular fa-star" id="1"></i>
                <input type="checkbox" name="reviewStar" hidden/>
                <i class="fa-regular fa-star" id="2"></i>
                <input type="checkbox" name="reviewStar" hidden/>
                <i class="fa-regular fa-star" id="3"></i>
                <input type="checkbox" name="reviewStar" hidden/>
                <i class="fa-regular fa-star" id="4"></i>
                <input type="checkbox" name="reviewStar" hidden/>
                <i class="fa-regular fa-star" id="5"></i>
            </li>
            <li class="review-insert-form-items">
                <p>내용</p>
                <textarea name="reviewContent" cols="65" rows="5"></textarea>
            </li>
            <li class="review-insert-form-items">
                <p></p>
                <div id="review-insert-confirm-wrapper">
                    <button type="button" class="btn-modify mypage-review-save">후기 작성</button>
                    <button type="button" class="btn-modify mypage-review-list">이용 내역</button>
                </div>
            </li>
        </ul>
    </form>
</div>

<script type="text/javascript">
    $(".fa-star").click(function (){
        $("input[name=reviewStar]").attr("checked", false)
        for(let i = 0; i < parseInt($(this).attr("id")); i++){
            $("input[name=reviewStar]").eq(i).attr("checked", true)
        }
        $("input[name=reviewStar]").each(function (key, value){
            if(value.getAttribute("checked") == "checked"){
                value.nextSibling.nextSibling.classList.remove("fa-regular")
                value.nextSibling.nextSibling.classList.add("fa-solid")
            } else{
                value.nextSibling.nextSibling.classList.remove("fa-solid")
                value.nextSibling.nextSibling.classList.add("fa-regular")
            }
        })
    })

    $(".mypage-review-save").click(function (){
        if($("input[name=reviewStar]:checked").length == 0 || $("textarea[name=reviewContent]").val().trim() == ""){
            alert("별점과 내용을 입력해주세요.")
        } else{
            $(".mypage-review-form").submit()
        }
    })

    $(".mypage-review-list").click(function (){
        location.href = "MyReservationList?type=done&period=all"
    })

</script>