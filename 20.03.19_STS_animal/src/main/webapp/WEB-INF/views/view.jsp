<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

   <table>
      <tbody>
         <tr>
            <td colspan="3" width="400">
               <!-- 이미지 -->
               <img src="${vo.popfile }">
            </td>
         </tr>
         <tr>
            <td height="20" align="center" bgcolor="#669AB3" width="70">
               공고번호
            </td>
            <td>
               <!-- 공고번호 -->
               ${vo.noticeNo }
            </td>
         </tr>
         <tr>
            <td height="20" align="center" bgcolor="#669AB3" width="70">
               품종
            </td>
            <td>
               <!-- 품종 -->
               ${vo.kindCd }
            </td>
         </tr>
         <tr>
            <td height="20" align="center" bgcolor="#669AB3" width="70">
               색상
            </td>
            <td>
               <!-- 색상 -->
               ${vo.colorCd }
            </td>
         </tr>
         <tr>
            <td height="20" align="center" bgcolor="#669AB3" width="70">
               성별
            </td>
            <td>
               <!-- 성별 -->
               ${vo.sexCd }
            </td>
         </tr>
         <tr>
            <td height="20" align="center" bgcolor="#669AB3" width="70">
               나이/체중
            </td>
            <td>
               <!-- 나이/체중 -->
               ${vo.age } / ${vo.weight }
            </td>
         </tr>
         <tr>
            <td height="20" align="center" bgcolor="#669AB3" width="70">
               접수일시
            </td>
            <td>
               <!-- 접수일시 -->
               ${vo.happenDt }
            </td>
         </tr>
         <tr>
            <td height="20" align="center" bgcolor="#669AB3" width="70">
               발생장소
            </td>
            <td>
               <!-- 발생장소 -->
               ${vo.happenPlace }
            </td>
         </tr>
         <tr>
            <td height="20" align="center" bgcolor="#669AB3" width="70">
               특징
            </td>
            <td>
               <!-- 특징 -->
               ${vo.specialMark }
            </td>
         </tr>
         <tr>
            <td height="20" align="center" bgcolor="#669AB3" width="70">
               공고기한
            </td>
            <td>
               <!-- 공고기한 -->
               ${vo.noticeSdt } ~ ${vo.noticeEdt }
            </td>
         </tr>
      </tbody>
   </table>
   
   <div>
      <p>** 유기동물 문의는 보호센터에 연락하시기 바랍니다. </p>
   </div>
   
   <table>
      <tbody>
         <tr>
            <td height="20" align="center" bgcolor="#669AB3" width="70">
               보호센터이름
            </td>
            <td>
               ${vo.careNm }
            </td>
            <td height="20" align="center" bgcolor="#669AB3" width="70">
               전화번호
            </td>
            <td>
               ${vo.careTel }
            </td>
         </tr>
         <tr>
            <td height="20" align="center" bgcolor="#669AB3" width="70">
               보호장소
            </td>
            <td colspan="3">
            <!-- 보호장소 클릭시 map.inc로 보내 지도로 보내는 위도와 경도를 구하게 함 -->
              <a href="javascript:location.href='map.inc?careAddr=${vo.careAddr }&nowPage=${param.nowPage}'"></a>
            </td>
         </tr>
         <tr>
            <td height="20" align="center" bgcolor="#669AB3" width="70">
               관할기관
            </td>
            <td colspan="3">
               ${vo.orgNm }
            </td>
         </tr>
         <tr>
            <td height="20" align="center" bgcolor="#669AB3" width="70">
               담당자
            </td>
            <td>
               ${vo.chargeNm }
            </td>
            <td height="20" align="center" bgcolor="#669AB3" width="70">
               연락처
            </td>
            <td>
               ${vo.officetel }
            </td>
         </tr>
      </tbody>
   </table>
   
   <p>
      <strong>&nbsp;&nbsp;<br />
         상기 동물을 분실하신 소유주께서는 보호센터로 문의하시어 동물을 찾아가시기 바라며,  동물보호 법 제17조<br /><br />
         의 규정에 따른 공고가 있는 날부터 10일이 경과하여도 소유자 등을 알 수 없는 경우에는 유실물법  제12조<br /><br />
         및 민법 제253조의 규정에 불구하고 해당 시,군,구자치구가 그 동물의 소유권을 취득하게 됩니다.<br /><br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         2020 년 03 월 19 일
         <br /><br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         거제시장(직인생략)
        </strong>
   </p>
   
   <div>
      <input type="button" value="목록" onclick="javascript:location.href='view.inc?desertionNo=${vo.desertionNo}&nowPage=${param.nowPage}'">
   </div>
</body>
</html>





















