<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>동틀무렵 - 관리자 대시보드</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap"
	rel="stylesheet">

<style>
/* 기본 스타일 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	display: flex;
	min-height: 100vh;
	background-color: #f8f9fa;
	line-height: 1.6;
}

/* 좌측 사이드바 */
.sidebar {
	width: 280px;
	background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
	padding: 0;
	height: 100vh;
	position: sticky;
	top: 0;
	border-right: 1px solid #e9ecef;
	box-shadow: 2px 0 20px rgba(0, 0, 0, 0.05);
}

.sidebar-logo {
	padding: 30px 20px;
	font-size: 28px;
	font-weight: 900;
	color: #333333;
	height: auto;
	border-bottom: 1px solid #e9ecef;
	margin-bottom: 30px;
	text-align: center;
	background: #ffffff;
	letter-spacing: -1px;
}

.sidebar-category {
	padding: 20px 20px 15px;
	font-size: 14px;
	font-weight: 700;
	color: #666666;
	margin-bottom: 10px;
	text-transform: uppercase;
	letter-spacing: 1px;
}

.sidebar-menu {
	list-style: none;
	padding: 0 15px;
}

.sidebar-menu li {
	margin-bottom: 8px;
	border-radius: 12px;
	overflow: hidden;
	transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.sidebar-menu li a {
	display: flex;
	align-items: center;
	padding: 18px 20px;
	text-decoration: none;
	color: #555555;
	font-weight: 500;
	font-size: 15px;
	transition: all 0.3s ease;
	border-radius: 12px;
}

.sidebar-menu li:hover {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	transform: translateX(5px);
}

.sidebar-menu li:hover a {
	color: white;
	font-weight: 600;
}

.sidebar-menu li.active {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
}

.sidebar-menu li.active a {
	color: white;
	font-weight: 600;
}

.sidebar-menu i {
	margin-right: 15px;
	width: 20px;
	text-align: center;
	font-size: 16px;
}

/* 메인 콘텐츠 영역 */
.main-content {
	flex: 1;
	display: flex;
	flex-direction: column;
	background-color: #f8f9fa;
}

/* 상단 헤더 */
.top-menu {
	background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 40px;
	position: sticky;
	top: 0;
	z-index: 100;
	border-bottom: 1px solid #e9ecef;
	box-shadow: 0 2px 20px rgba(0, 0, 0, 0.05);
}

.nav-links {
	display: flex;
	list-style: none;
	align-items: center;
}

.nav-links li {
	margin: 0 20px;
	position: relative;
	padding: 12px 8px;
}

.nav-links li a {
	text-decoration: none;
	color: #333333;
	font-weight: 600;
	font-size: 16px;
	transition: all 0.3s ease;
}

.nav-links li.active a {
	color: #667eea;
	font-weight: 700;
}

.nav-links li.active::after {
	content: '';
	position: absolute;
	height: 3px;
	width: 100%;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	bottom: 0;
	left: 0;
	border-radius: 2px;
}

.nav-links li a:hover {
	color: #667eea;
}

.auth-buttons {
	display: flex;
	align-items: center;
	gap: 15px;
}

.auth-buttons .admin-info {
	font-size: 14px;
	color: #666666;
	font-weight: 500;
}

.auth-buttons button {
	padding: 12px 24px;
	border-radius: 25px;
	border: none;
	cursor: pointer;
	font-weight: 600;
	font-size: 14px;
	transition: all 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
	letter-spacing: 0.5px;
}

.register-btn {
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	color: white;
	box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
}

.register-btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
}

/* 콘텐츠 영역 */
.content {
	flex: 1;
	padding: 40px;
	background-color: #f8f9fa;
}

/* 페이지 제목 */
.page-header {
	margin-bottom: 40px;
	text-align: center;
}

.page-header h1 {
	font-size: 36px;
	font-weight: 900;
	color: #333333;
	margin-bottom: 15px;
	letter-spacing: -1px;
}

.page-header p {
	font-size: 18px;
	color: #666666;
	font-weight: 400;
}

/* 통계 카드 */
.stats-overview {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
	gap: 25px;
	margin-bottom: 50px;
}

.stat-card {
	background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
	border-radius: 20px;
	padding: 30px;
	text-align: center;
	transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
	border: 1px solid #e9ecef;
	position: relative;
	overflow: hidden;
}

.stat-card::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	height: 4px;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.stat-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
}

.stat-card .icon {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 auto 20px;
	color: white;
	font-size: 24px;
}

.stat-card h3 {
	font-size: 14px;
	font-weight: 600;
	color: #666666;
	margin-bottom: 10px;
	text-transform: uppercase;
	letter-spacing: 1px;
}

.stat-card .number {
	font-size: 32px;
	font-weight: 900;
	color: #333333;
	margin-bottom: 5px;
}

.stat-card .unit {
	font-size: 14px;
	color: #999999;
	font-weight: 500;
}

/* 차트 영역 */
.charts-container {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 30px;
	margin-bottom: 50px;
}

.chart-box {
	background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
	border-radius: 20px;
	padding: 30px;
	border: 1px solid #e9ecef;
	transition: all 0.3s ease;
	position: relative;
	overflow: hidden;
}

.chart-box::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	height: 4px;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.chart-box:hover {
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

.chart-box canvas {
	max-height: 400px;
}

/* 반응형 디자인 */
@media (max-width: 1400px) {
	.charts-container {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media (max-width: 1024px) {
	.sidebar {
		width: 240px;
	}
	
	.content {
		padding: 30px 25px;
	}
	
	.charts-container {
		grid-template-columns: 1fr;
	}
	
	.stats-overview {
		grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
		gap: 20px;
	}
}

@media (max-width: 768px) {
	body {
		flex-direction: column;
	}
	
	.sidebar {
		width: 100%;
		height: auto;
		position: relative;
	}
	
	.sidebar-menu {
		display: flex;
		overflow-x: auto;
		padding: 0 15px;
	}
	
	.sidebar-menu li {
		flex-shrink: 0;
		margin-right: 10px;
	}
	
	.content {
		padding: 20px 15px;
	}
	
	.page-header h1 {
		font-size: 28px;
	}
	
	.stats-overview {
		grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
	}
}

/* 로딩 애니메이션 */
@keyframes fadeInUp {
	from {
		opacity: 0;
		transform: translateY(30px);
	}
	to {
		opacity: 1;
		transform: translateY(0);
	}
}

.stat-card, .chart-box {
	animation: fadeInUp 0.6s ease forwards;
}

.stat-card:nth-child(2) { animation-delay: 0.1s; }
.stat-card:nth-child(3) { animation-delay: 0.2s; }
.stat-card:nth-child(4) { animation-delay: 0.3s; }
.stat-card:nth-child(5) { animation-delay: 0.4s; }
.stat-card:nth-child(6) { animation-delay: 0.5s; }

.chart-box:nth-child(2) { animation-delay: 0.3s; }
.chart-box:nth-child(3) { animation-delay: 0.6s; }
.chart-box:nth-child(4) { animation-delay: 0.9s; }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
$(function() {
	var months = [];
	var counts = [];

        <c:forEach items="${memberChartList}" var="stat">
            months.push("${stat.join_mouth}");
            counts.push(${stat.join_count});  
        </c:forEach> 
        	
        // Chart.js를 사용하여 막대 그래프 생성
        const ctx1 = document.getElementById('memberJoinChart').getContext('2d');
        const memberJoinChart = new Chart(ctx1, {
            type: 'bar',
            data: {
                labels: months,
                datasets: [{
                    label: '월별 가입자 수',
                    data: counts,
                    backgroundColor: 'rgba(102, 126, 234, 0.8)',
                    borderColor: 'rgba(102, 126, 234, 1)',
                    borderWidth: 2,
                    borderRadius: 8,
                    borderSkipped: false,
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                plugins: {
                    legend: {
                        display: false
                    },
                    title: {
                        display: true,
                        text: '월별 회원가입 통계',
                        font: {
                            size: 20,
                            weight: 'bold'
                        },
                        color: '#333',
                        padding: 20
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: '가입자 수',
                            font: {
                                size: 14,
                                weight: 'bold'
                            }
                        },
                        grid: {
                            color: '#f0f0f0'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: '월',
                            font: {
                                size: 14,
                                weight: 'bold'
                            }
                        },
                        grid: {
                            display: false
                        }
                    }
                }
            }
        });
        
        const activityData = {
                labels: ['등산', '달리기', '걷기'],
                datasets: [{
                    data: [${getActivitySummary.total_hiking_cnt},${getActivitySummary.total_running_cnt},${getActivitySummary.total_walking_cnt}],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.8)',
                        'rgba(54, 162, 235, 0.8)',
                        'rgba(75, 192, 192, 0.8)'
                    ],
                    borderColor: [
                        'rgb(255, 99, 132)',
                        'rgb(54, 162, 235)',
                        'rgb(75, 192, 192)'
                    ],
                    borderWidth: 2,
                    hoverOffset: 8
                }]
        }; 

        // 차트 생성
        const ctx2 = document.getElementById('activityChart').getContext('2d');
        const activityChart = new Chart(ctx2, {
            type: 'doughnut',
            data: activityData,
            options: {
                responsive: true,
                maintainAspectRatio: true,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            padding: 20,
                            font: {
                                size: 14
                            }
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                const label = context.label || '';
                                const value = context.raw || 0;
                                const total = context.dataset.data.reduce((acc, data) => acc + data, 0);
                                const percentage = ((value / total) * 100).toFixed(1);
                                return label + ": " + value + "회 (" + percentage + "%)";
                            }
                        }
                    },
                    title: {
                        display: true,
                        text: '활동 유형별 분포',
                        font: {
                            size: 20,
                            weight: 'bold'
                        },
                        color: '#333',
                        padding: 20
                    }
                },
                cutout: '60%'
            }
        });
        
        // 게시글 좋아요 순위 차트 데이터 (예시 데이터 - 실제로는 컨트롤러에서 전달받아야 함)
        // ${topLikedPosts}와 같은 형태로 데이터를 받아와야 합니다
        var postTitles = [];
        var likeCounts = [];

        // 컨트롤러에서 전달받은 데이터 사용 (예시)
        <c:forEach items="${topLikedPosts}" var="post" varStatus="status">
            postTitles.push("게시글 ${status.count}");
            likeCounts.push(${post.like_count});  
        </c:forEach>

        // 임시 데이터 (실제 구현시 삭제,실제로 가져올 내용은 DB의 글제목과 좋아요 수)
        if(postTitles.length === 0) {
            postTitles = ['인기글1', '인기글2', '인기글3', '인기글4', '인기글5', '인기글6', '인기글7', '인기글8', '인기글9', '인기글10'];
            likeCounts = [150, 135, 120, 98, 87, 76, 65, 54, 43, 32];
        }

        // 게시글 좋아요 순위 차트
        const ctx3 = document.getElementById('topLikedPostsChart').getContext('2d');
        const topLikedPostsChart = new Chart(ctx3, {
            type: 'bar',
            data: {
                labels: postTitles,
                datasets: [{
                    label: '좋아요 수',
                    data: likeCounts,
                    backgroundColor: 'rgba(255, 159, 64, 0.8)',
                    borderColor: 'rgba(255, 159, 64, 1)',
                    borderWidth: 2,
                    borderRadius: 8,
                    borderSkipped: false,
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                indexAxis: 'y', // 가로 막대 그래프
                plugins: {
                    legend: {
                        display: false
                    },
                    title: {
                        display: true,
                        text: '인기 게시글 TOP 10',
                        font: {
                            size: 20,
                            weight: 'bold'
                        },
                        color: '#333',
                        padding: 20
                    }
                },
                scales: {
                    x: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: '좋아요 수',
                            font: {
                                size: 14,
                                weight: 'bold'
                            }
                        },
                        grid: {
                            color: '#f0f0f0'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: '게시글',
                            font: {
                                size: 14,
                                weight: 'bold'
                            }
                        },
                        grid: {
                            display: false
                        }
                    }
                }
            }
        });

        // 난이도별 등산코스 차트 데이터
        var hikingLevels = [];
        var hikingCounts = [];

        // 컨트롤러에서 전달받은 데이터 사용 (예시)
        <c:forEach items="${getHikingLevelChartList}" var="level">
            hikingLevels.push("${level.hiking_level}");
            hikingCounts.push(${level.hiking_count});  
        </c:forEach>

        // 임시 데이터 (실제 구현시 삭제)
        //if(hikingLevels.length === 0) {
        //    hikingLevels = ['하', '중', '상'];
       //     hikingCounts = [45, 32, 18];
        //}

        
        
        
        //getHikingLevelChartList
        
        
        
        //var hikingLevels = [];
       // var hikingCounts = [];


        
        
        // 난이도별 등산코스 차트
        const ctx4 = document.getElementById('hikingLevelChart').getContext('2d');
        const hikingLevelChart = new Chart(ctx4, {
            type: 'pie',
            data: {
                labels: hikingLevels,
                datasets: [{
                    data: hikingCounts,
                    backgroundColor: [
                        'rgba(46, 204, 113, 0.8)',
                        'rgba(241, 196, 15, 0.8)',
                        'rgba(231, 76, 60, 0.8)'
                    ],
                    borderColor: [
                        'rgb(46, 204, 113)',
                        'rgb(241, 196, 15)',
                        'rgb(231, 76, 60)'
                    ],
                    borderWidth: 2,
                    hoverOffset: 8
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            padding: 20,
                            font: {
                                size: 14
                            }
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                const label = context.label || '';
                                const value = context.raw || 0;
                                const total = context.dataset.data.reduce((acc, data) => acc + data, 0);
                                const percentage = ((value / total) * 100).toFixed(1);
                                return label + ": " + value + "개 (" + percentage + "%)";
                            }
                        }
                    },
                    title: {
                        display: true,
                        text: '난이도별 등산코스 분포',
                        font: {
                            size: 20,
                            weight: 'bold'
                        },
                        color: '#333',
                        padding: 20
                    }
                }
            }
        });
        
});
</script> 

</head>
<body>
	<!-- 좌측 사이드바 -->
	<div class="sidebar">
		<div class="sidebar-logo">동틀무렵</div>
		<div class="sidebar-category">관리자 메뉴</div>
		<ul class="sidebar-menu">
			<li class="active">
				<a href="getAdminHumanList">
					<i class="fas fa-chart-pie"></i>
					<span>대시보드</span>
				</a>
			</li>
			<li>
				<a href="getAdminHumanList">
					<i class="fas fa-users"></i>
					<span>회원관리</span>
				</a>
			</li>
		</ul>
	</div>

	<!-- 메인 콘텐츠 영역 -->
	<div class="main-content">
		<!-- 상단 헤더 -->
		<div class="top-menu">
			<ul class="nav-links">
				<li class="active"><a href="#">관리자 대시보드</a></li>
			</ul>
			<div class="auth-buttons">
				<span class="admin-info">관리자님 환영합니다!</span>		
				<button class="register-btn" onclick="location.href='/controller/logout'">
					<i class="fas fa-sign-out-alt"></i>
					로그아웃
				</button>
			</div>
		</div>

		<!-- 콘텐츠 영역 -->
		<div class="content">
			<!-- 페이지 헤더 -->
			<div class="page-header">
				<h1>관리자 대시보드</h1>
				<p>동틀무렵 서비스의 전체 현황을 한눈에 확인하세요</p>
			</div>

			<!-- 통계 카드 -->
			<div class="stats-overview">
				<div class="stat-card">
					<div class="icon">
						<i class="fas fa-users"></i>
					</div>
					<h3>전체 회원수</h3>
					<div class="number">${adminDashBoard.totalMembers}</div>
					<div class="unit">명</div>
				</div>
				
				<div class="stat-card">
					<div class="icon">
						<i class="fas fa-user-check"></i>
					</div>
					<h3>활성 회원수</h3>
					<div class="number">${adminDashBoard.activeMembers}</div>
					<div class="unit">명</div>
				</div>
				
				<div class="stat-card">
					<div class="icon">
						<i class="fas fa-user-plus"></i>
					</div>
					<h3>오늘 가입</h3>
					<div class="number">${adminDashBoard.todayJoinedMembers}</div>
					<div class="unit">명</div>
				</div>
				
				<div class="stat-card">
					<div class="icon">
						<i class="fas fa-calendar-alt"></i>
					</div>
					<h3>이번달 가입</h3>
					<div class="number">${adminDashBoard.monthJoinedMembers}</div>
					<div class="unit">명</div>
				</div>
				
				<div class="stat-card">
					<div class="icon">
						<i class="fas fa-user-clock"></i>
					</div>
					<h3>휴면 회원수</h3>
					<div class="number">${adminDashBoard.dormantMembers}</div>
					<div class="unit">명</div>
				</div>
				
				<div class="stat-card">
					<div class="icon">
						<i class="fas fa-user-times"></i>
					</div>
					<h3>탈퇴 회원수</h3>
					<div class="number">${adminDashBoard.withdrawnMember}</div>
					<div class="unit">명</div>
				</div>
			</div>

			<!-- 차트 컨테이너 -->
			<div class="charts-container">
				<div class="chart-box">
					<canvas id="memberJoinChart"></canvas>
				</div>
				
				<div class="chart-box">
					<canvas id="activityChart"></canvas>
				</div>
				
				<div class="chart-box">
					<canvas id="topLikedPostsChart"></canvas>
				</div>
				
				<div class="chart-box">
					<canvas id="hikingLevelChart"></canvas>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>