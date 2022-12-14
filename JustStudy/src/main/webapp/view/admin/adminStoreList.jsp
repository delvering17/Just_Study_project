<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model_p.BranchDTO" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
      integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>

<style>

    .admin-store-list-main {
        width: 100%;
        height: fit-content;
        padding: 20px 20px;
    }

    .admin-store-list-table {
        width: 1101px;
        border: 1px solid rgb(122, 115, 115);
        margin-top: 10px;
    }

    .admin-store-list-table th {
        border: 1px solid rgb(97, 88, 88);
        font-size: 13px;
    }

    .admin-store-list-table th:nth-of-type(1),
    .admin-store-list-table th:nth-of-type(2),
    .admin-store-list-table th:nth-of-type(4){
        width: 70px;
    }
    .admin-store-list-table th:nth-of-type(3),
    .admin-store-list-table th:nth-of-type(5),
    .admin-store-list-table th:nth-of-type(8),
    .admin-store-list-table th:nth-of-type(9){
        width: 120px;
    }
    .admin-store-list-table th:nth-of-type(6){
        width: 250px;
    }
    .admin-store-list-table th:nth-of-type(7){
        width: 160px;
    }

    .admin-store-list-table td {
        border: 1px solid rgb(97, 88, 88);
        text-align: center;
        font-size: 13px;
        height: 30px;
        padding-top: 5px;
        padding-bottom: 5px;
    }

    .admin-store-list-table tr:first-of-type {
        height: 50px;
        padding: 10px;
        color: #fff;
        background: rgba(83, 104, 167, 0.856);
    }

    .admin-store-list-detail:link,
    .admin-store-list-detail:visited {
        color: mediumblue;
    }

    .admin-store-list-detail:hover {
        color: dodgerblue;
    }

</style>

<div class="admin-store-list-main">

    <form action="AdminStoreList" class="admin-store-search-form">
        <div>
            <select name="filter">
                <option value="city">??????</option>
                <option value="name">?????????</option>
                <option value="rooms">?????????</option>
                <option value="price">????????????</option>
                <option value="address">????????????</option>
                <option value="addressDetail">????????????</option>
                <option value="phone">????????????</option>
                <option value="facilities">????????????</option>
            </select>
            <input type="text" name="word">
            <button type="button" class="admin-store-list-search"><i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </div>
    </form>

    <table cellspacing="0" cellpadding="0" style="border-collapse:collapse" class="admin-store-list-table">
        <tr>
            <th>??????</th>
            <th>?????????</th>
            <th>?????????</th>
            <th>????????????<br/>(1??????)</th>
            <th>?????? ??????</th>
            <th>?????? ??????</th>
            <th>?????? ??????</th>
            <th>????????????</th>
            <th>?????? ??????</th>
        </tr>

        <%
            LinkedHashMap<String, Integer> branchMap = (LinkedHashMap<String, Integer>) request.getAttribute("branchMap");
            ArrayList<BranchDTO> branchList = (ArrayList<BranchDTO>) request.getAttribute("branchList");

            if (branchList.size() != 0) {
                for (String city : branchMap.keySet()) {
                    if (branchMap.get(city) != 0) {%>
        <tr>
            <td rowspan="<%=branchMap.get(city) +1%>"><%=city%>
            </td>
        </tr>
        <%
            for (BranchDTO branchDTO : branchList) {
                if (city.equals(branchDTO.getCity())) {
        %>
        <tr class="branch">
            <td><a class="admin-store-list-detail" href="AdminStoreDetail?branchName=<%=branchDTO.getName()%>"><%=branchDTO.getName()%>
            </a></td>
            <td><%=(branchDTO.getRooms() != null ? branchDTO.getRooms().replaceAll(",", "<br/>") : "")%>
            </td>
            <td><fmt:formatNumber value="<%=branchDTO.getPrice()%>" type="number"/>
            </td>
            <td>
                <%
                    String openTime = (branchDTO.getOpen() > 9 ? "" : "0") + branchDTO.getOpen() + ":00";
                    String closeTime = (branchDTO.getClose() > 9 ? "" : "0") + branchDTO.getClose() + ":00";
                %>
                <%=openTime%> ~ <%=closeTime%>
            </td>
            <td><%=(branchDTO.getAddress() != null ? branchDTO.getAddress() : "")%>
            </td>
            <td><%=(branchDTO.getAddressDetail() != null ? branchDTO.getAddressDetail() : "")%>
            </td>
            <td><%=(branchDTO.getPhone() != null ? branchDTO.getPhone() : "")%>
            </td>
            <td><%=(branchDTO.getFacilities() != null ? branchDTO.getFacilities().replaceAll(",", "<br/>") : "")%>
            </td>
        </tr>
        <%
                        }
                    }
                }
            }
        } else {%>
        <tr>
            <td colspan="9">???????????? ????????? ????????????.</td>
        </tr>
        <%}%>
    </table>
</div>

<script type="text/javascript">
    $(".admin-template-header>b").html("?????? ??????")
    $(".admin-template-header>div").append("<input type=button class='admin-store-insert' value='??????'/>")

    $(".admin-store-insert").click(function () {
        location.href = "AdminStoreInsert"

    })
    $(".admin-store-list-search").click(function () {
        if ($("input[name=word]").val().trim() == "") {
            alert("???????????? ??????????????????.")
        } else {
            $(".admin-store-search-form").submit()
        }

    })

    $(".branch").each(function (key, value){
        if(key % 2 == 1){
            value.style.background = 'rgba(227, 233, 240, 0.726)'
        }
    })

</script>