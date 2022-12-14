<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

    <style type="text/css">
        .footer-bg{
            width: 100%;
            height: 150px;
            background: #353535;
            padding-left: 100px;
            padding-top: 30px;
        }
        .footer-link{
            width: fit-content;
            background: none;
            border: none;
            color: white;
            margin-right: 30px;
            font-weight: bold;
            font-size: 1rem;
            cursor: pointer;
        }
        .footer-link-dev{
            width: fit-content;
            background: none;
            border: none;
            color: grey;
            margin-right: 30px;
            font-weight: bold;
            font-size: 1rem;
            cursor: pointer;
        }
        .footer-info{
            color: lightgray;
            font-size: 0.9rem;
            margin-top: 20px;
            height: 25px;
            line-height: 25px;
        }

        #personal-info .modal-header,
        #email-ban .modal-header{
            font-weight: bold;
            font-size: 1.2rem;
        }

        #email-ban, #personal-info, #developer{
            margin-top: 5%;
            height: 500px;
        }

        .btn-footer-admin {
            text-decoration: none;
        }
    </style>
<div class="footer-bg">
    <div>
        <button class="footer-link" data-bs-toggle="modal" data-bs-target="#personal-info">개인정보처리방침</button>
        <button class="footer-link" data-bs-toggle="modal" data-bs-target="#email-ban">이메일무단수집거부</button>
        <button class="footer-link customer-service" data-bs-toggle="modal" data-bs-target="#customer-service">고객센터</button>
        <button class="footer-link-dev" data-bs-toggle="modal" data-bs-target="#developer">개발자정보</button>
        <c:if test="${sessionScope.level == 2}">
            <button class="footer-link-dev"><a class="btn-footer-admin" href="../admin/AdminPage" >관리자 페이지</a></button>
        </c:if>

    </div>
    <div class="footer-info">
        (주)JustStudy 김김송송 사업자등록번호:000-11-22222 통신판매번호:2022-서울 강남-3333 서울 강남구 테헤란로5길 24, 4층 T.3481-1005 juststudy@juststudycafe.com<br/>
        Copyright&copy;JUST_STUDYCAFE All Rights Reserved
    </div>
</div>

<div id="personal-info" class="modal">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                개인정보처리방침
                <button class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                주식회사 JustStudy(이하 '회사’)는 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다. 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다. 본 방침은 년 월 일부터 시행됩니다.<br/><br/><br/>1. 개인정보의 수집 및 이용 목적<br/>① 회사는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며 이용 목적이 변경될 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br/>가. 고객상담 : 가맹 관련 문의 확인 및 답변을 위한 연락통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.<br/>나. 정보제공 : 회사에서 주최하는 프로그램에 대한 정보 제공 등의 목적으로 개인정보를 처리합니다.<br/>② 회사는 다음과 같은 방법으로 개인정보를 수집합니다.<br/>- 홈페이지<br/><br/>2. 처리하는 개인정보 항목<br/>① 회사는 다음의 개인정보 항목을 처리하고 있습니다.<br/>“개인 정보"는 귀하를 식별, 연관, 설명하고, 귀하와의 연락에 사용할 수 있는, 혹은 귀하에게 직접적 또는 간접적으로 연결될 수 있는 데이터입니다. 본 정책의 목적상, “개인 정보”와 “개인 데이터"라는 용어 사이에 의미상의 구별은 없습니다.<br/><br/>저희가 귀하로부터 직접 수집하는 개인 정보. 귀하가 당사의 서비스를 방문하거나 사용할 때 당사는 귀하로부터 다음과 같은 개인 정보를 직접 수집합니다.<br/><br/>가. 고객상담<br/>- 필수항목 : 이름, 연락처 (접속 IP 정보, 쿠키, 서비스 이용 기록, 접속 로그)<br/>- 선택항목 : 없음<br/>나. 정보제공<br/>- 필수항목 : 이름, 연락처 (접속 IP 정보, 쿠키, 서비스 이용 기록, 접속 로그)<br/>- 선택항목 : 없음<br/>다. 스터디룸 예약<br/>*개인 세부 정보 (예: 이름, 생년월일, 성별)<br/>*연락처 정보 (예: 이메일 주소, 주소, 전화번호)<br/>*예약 정보 (예약자 성명/번호, 예약 지점명, 예약룸타입. 예약 날짜와 시각, 예약내역, 이용금액)<br/>*계정 정보 (예: 이메일 주소 및 비밀번호, 계정 설정 등 로그인 자격 증명)<br/>*결제 정보 (신용카드, 직불카드 또는 기타 결제 카드 정보 및 청구지 주소 등)<br/>*연락처 (당사 서비스를 통해 귀하의 예약을 통지하는 연락처 정보 등)<br/><br/>3. 개인정보의 처리 및 보유 기간<br/>① 회사는 법령에 따른 개인정보 보유.이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유, 이용기간 내에서 개인정보를 처리, 보유합니다.<br/>② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.<br/>가. 고객상담 : 사이트 이용자의 문의 확인 및 답변을 위한 연락통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.<br/>나. 정보제공 : 회사에서 주최하는 프로그램에 대한 정보 제공 등의 목적으로 개인정보를 처리합니다.<br/>다. 개인정보 보유기간 : 5년<br/><br/>4. 개인정보의 파기<br/>① 회사는 원칙적으로 개인정보 처리목적이 달성된 경우에는 보유기간을 거친 후 지체 없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.<br/>- 파기절차 : 이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.<br/>- 파기기한 : 이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.<br/>- 파기방법 : 전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다. 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.<br/><br/>5. 개인정보의 제3자 제공에 관한 사항<br/>① 회사는 원칙적으로 이용자의 개인정보를 1. 개인정보의 수집 및 이용 목적에서 명시한 범위 내에서 처리하며, 이용자의 사전 동의 없이는 본래의 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다.<br/>단, 다음의 경우에는 개인정보를 처리할 수 있습니다.<br/>- 이용자가 사전에 제3자 제공 및 공개에 동의한 경우<br/>- 법령 등에 의해 제공이 요구되는 경우<br/>- 서비스의 제공에 관한 계약의 이행을 위하여 필요한 개인정보로서 경제적/기술적인 사유로 통상의 동의를 받는 것이 현저히 곤란한 경우<br/>- 개인을 식별하기에 특정할 수 없는 상태로 가공하여 이용하는 경우<br/>② 개인정보를 제3자에게 제공하게 될 시 개인정보 취급방침을 통하여 반드시 제공받는 자, 이용목적, 제공하는 개인정보 항목, 보유 및 이용기간 등에 대한 내용을 고지합니다.<br/>③ 단, 이용자가 제3자 제공 및 공개에 동의하지 않은 경우 회사에서 제공하는 서비스의 제한 혹은 정보 습득에 있어 불이익을 얻을 수 있습니다.<br/><br/>6. 개인정보 처리의 위탁<br/>① 회사는 개인정보를 위탁하지 않으며, 개인정보를 위탁하게 될 시 최소 15일 전에 별도로 공지사항을 통해 공지한 뒤 개인정보 취급방침을 개정합니다.<br/><br/>7. 정보주체의 권리, 의무 및 행사방법<br/>① 정보주체는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.<br/>가. 개인정보 열람요구<br/>나. 오류 등이 있을 경우 정정 요구<br/>다. 삭제요구<br/>라. 처리정지 요구<br/>② 제1항에 따른 권리 행사는 회사에 대해 개인정보 보호법 시행규칙 별지 제8호 서식에 따라 서면, 전자우편, FAX 등을 통하여 하실 수 있으며 회사는 이에 대해 지체 없이 조치하겠습니다.<br/>③ 정보주체가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우 회사는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.<br/>④ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.<br/><br/>8. 개인정보 수집 장치의 설치, 운영 및 거부에 관한 사항<br/>① 회사는 고객님의 정보를 수시로 저장하고 찾아내는 '쿠키(cookie)' 등을 운용합니다.<br/>가. 쿠키란?<br/>- 회사는 개인화되고 맞춤화된 서비스를 제공하기 위해서 이용자의 정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용합니다.<br/>- 쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에게 보내는 아주 작은 텍스트 파일로 이용자 컴퓨터의 하드디스크에 저장됩니다. 이후 이용자가 웹 사이트에 방문할 경우 웹 사이트 서버는 이용자의 하드 디스크에 저장되어 있는 쿠키의 내용을 읽어 이용자의 환경설정을 유지하고 맞춤화된 서비스를 제공하기 위해 이용됩니다.<br/>- 쿠키는 개인을 식별하는 정보를 자동적/능동적으로 수집하지 않으며, 이용자는 언제든지 이러한 쿠키의 저장을 거부하거나 삭제할 수 있습니다.<br/>나. 회사의 쿠키 사용 목적<br/>- 이용자들이 방문한 회사의 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 이용자 규모 등을 파악하여 이용자에게 광고를 포함한 최적화된 맞춤형 정보를 제공하기 위해 사용합니다.<br/>다. 쿠키의 설치/운영 및 거부<br/>- 이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 이용자는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.<br/>- 다만, 쿠키의 저장을 거부할 경우에는 일부 서비스는 이용에 어려움이 있을 수 있습니다.<br/>- 쿠키 설치 허용 여부를 지정하는 방법 (Internet Explorer의 경우)은 다음과 같습니다.<br/>(1) [도구] 메뉴에서 [인터넷 옵션]을 선택합니다.<br/>(2) [개인정보 탭]을 클릭합니다.<br/>(3) [개인정보취급 수준]을 설정하시면 됩니다.<br/><br/>9. 개인정보관리책임자<br/>① 회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<br/>▶ 개인정보 보호 책임자<br/>- 부서명:<br/>- 담당자:<br/>- 연락처:<br/>② 정보주체는 회사의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 회사는 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.<br/>
            </div>
        </div>
    </div>
</div>

<div id="developer" class="modal">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                개발자정보
                <button class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                🦔김지원 ekdhwldnjsdl@gmail.com <br/><br/>
                🐢김한솔 whay1216@gmail.com <br/><br/>
                🐳송지은 s.dieunn@gmail.com <br/><br/>
                🐝송찬욱 delvering17@gmail.com
            </div>
        </div>
    </div>
</div>

<div id="email-ban" class="modal">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                이메일무단수집거부
                <button class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                이용자에게 무차별적으로 보내지는 타사의 메일을 차단하기 위해,<br/>본 웹사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며, 이를 위반시 정보통신망법에 의해 형사처벌됨을 유념하시기 바랍니다.<br/><br/>[게시일 2022년 8월 31일]
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
        $(".customer-service").click(function (){
            location.href = "../mypage/MypageInquiryInsertForm"
        })
</script>