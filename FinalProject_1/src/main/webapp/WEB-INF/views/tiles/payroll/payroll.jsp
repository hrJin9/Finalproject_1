<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="payroll_header.jsp"%>
<style>
	.offcanvas-body::-webkit-scrollbar {
	    width: 8px;  /* 스크롤바의 너비 */
	}
	
	.offcanvas-body::-webkit-scrollbar-thumb {
	    height: 30%; /* 스크롤바의 길이 */
		background-color: rgba(0,0,0, 0.3);  /* 스크롤바의 색상 */
	    border-radius: 10px;
	}
	
	.offcanvas-body::-webkit-scrollbar-track {
		background-color: rgba(242, 242, 242); /*스크롤바 뒷 배경 색상*/
	}
</style>
<script>
	$(document).ready(function(){
		$(".pr-table tr").click(function(){
			$('.offcanvas').offcanvas('show');
		});
	});
	
</script>

<div class="payroll-container">
	<div class="payroll-date">
		<!-- 급여명세서 내역이 없을 때 -->
		<!-- 
		<div class="payroll-none">
			<div>
				<i class="fa-solid fa-circle-info"></i>
				<div>급여 명세서가 없습니다.</div>
			</div>
		</div>
		 -->
		
		<!-- 급여명세서 내역이 있을 때 -->
		<div class="paryoll-exist-list">
			<table class="pr-table">
				<tr>
					<td width="11%"><span>10</span>월 급여명세서</td>
					<td width="50%"><span>2022. 11. 5</span> 지급</td>
					<td>지급<span><span>5,000,000</span>원</span></td>
					<td>공제<span><span>2,000,000</span>원</span></td>
					<td><span><span>3,000,000</span>원</span></td>
					<td><i class="fa-solid fa-download"></i></td>
				</tr>
				<tr>
					<td><span>11</span>월 급여명세서</td>
					<td><span>2022. 12. 5</span> 지급</td>
					<td><span>지급<span>5,000,000</span>원</span></td>
					<td><span>공제<span>2,000,000</span>원</span></td>
					<td><span><span>3,000,000</span>원</span></td>
					<td><i class="fa-solid fa-download"></i></td>
				</tr>
			</table>
		</div>
		
		
		
		
		<!-- 오프캔버스 시작 -->
		<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel" style="width: 45%;">
		  <div class="offcanvas-header">
		    <div class="offcanvas-title headeroffcanvas" id="offcanvasScrollingLabel"></div>
		    <div class="do-oc-header">
		    	<div class="payroll-index">
					<div>2022. 11</div>
					<div></div>
					<div>
						<div>급여지급일</div>
						<div>2022년 12월 26일</div>
					</div>
					<div class="payroll-download">
						<i class="fa-solid fa-download" style="font-size: 10pt; display:inline-block;"></i>
						<div>급여명세서 다운로드</div>
					</div>
				</div>
		    </div>
		    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		  </div>
		  <hr class="HRhr"style="margin: 0; border:none; height:1px; background-color: rgba(242, 242, 242);"/>
		  <div class="offcanvas-body">
		  	<div class="payroll-exist">
				<div class="payroll-detail">
					<div class="payroll-payment">
						<div class="payroll-subject">실지급액<div class="subject-underline" style="background-color: #F29F05; width: 70px;"></div></div>
						<div><hr class="HRhr"/></div>
						<div class="payroll-subject">3,000,000원</div>
					</div>
					<div class="payroll-payment2">
						<div>
							<div class="payroll-subject">급여<div class="subject-underline" style="background-color: #F29F05; width: 35px;"></div></div>
							<div><hr class="HRhr"/></div>
							<div><div class="payroll-sub">지급총합</div><div class="payroll-subject">5,000,000원</div></div>
						</div>
						<div>
							<table class="payroll-detail-table">
								<tr><td rowspan="3">고정급여</td><td>기본급</td><td>4,800,000</td></tr>
								<tr><td>초과근무수량(고정)</td><td>50,000</td></tr>
								<tr><td>식비</td><td>50,000</td></tr>
								<tr><td rowspan="2">변동급여</td><td>연구보조비</td><td>50,000</td></tr>
								<tr><td>선지급금</td><td>50,000</td></tr>
							</table>
						</div>
					</div>
					<div class="payroll-deduction">
						<div>
							<div class="payroll-subject">공제<div class="subject-underline" style="background-color: #F29F05; width: 35px;"></div></div>
							<div><hr class="HRhr"/></div>
							<div><div class="payroll-sub">공제총합</div><div class="payroll-subject">2,000,000원</div></div>
						</div>
						<div>
							<table class="payroll-detail-table">
								<tr><td rowspan="6">필수공제</td><td>소득세</td><td>1,000,000</td></tr>
								<tr><td>지방소득세</td><td>50,000</td></tr>
								<tr><td>건강보험</td><td>200,000</td></tr>
								<tr><td>국민연금</td><td>300,000</td></tr>
								<tr><td>장기요양보험</td><td>50,000</td></tr>
								<tr><td>고용보험</td><td>50,000</td></tr>
								<tr><td rowspan="2">기타공제</td><td>동호회비</td><td>50,000</td></tr>
								<tr><td>선지급금</td><td>300,000</td></tr>
							</table>
						</div>
					</div>
					<div class="payroll-statistics">
						<div>
							<div class="payroll-subject">통계<div class="subject-underline" style="background-color: #F29F05; width: 35px;"></div></div>
							<div><hr class="HRhr"/></div>
						</div>
						<div class="payroll-st-graph">
							<div class="payroll-st-total">
								<div class="payroll-st-totalbar"></div>
								<div>실수령액 <span>지급 총액의</span><span>80%</span></div>
								<div>공제 총액 <span>20%</span></div>
							</div>
							<div class="payroll-st-payment">
								<table class="payroll-st-paymenttable">
									<tr>
										<td>고정급여<span>98%</span></td>
										<td rowspan="2">
											<div class="payroll-circle-graph">
											</div>
										</td>
									</tr>
									<tr><td>변동급여<span>2%</span></td></tr>
								</table>
							</div>
							<div class="payroll-st-deduction">
								<table class="payroll-st-deductiontable">
									<tr>
										<td>필수공제<span>70%</span></td>
										<td rowspan="2">
											<div class="payroll-circle-graph"></div>
										</td>
									</tr>
									<tr><td>기타공제<span>30%</span></td></tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		  </div>
		</div>
		<!-- 오프캔버스 끝 -->
		
	</div>
</div>