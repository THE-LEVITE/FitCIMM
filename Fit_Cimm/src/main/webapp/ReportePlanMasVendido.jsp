<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Plan Más Vendido del Mes - FitCIMM</title>

        <jsp:include page="header.jsp" />

        <style>
            .main-content {
                padding: 30px 40px;
            }

            .page-header-custom {
                padding: 0 0 18px 0;
                margin-bottom: 22px;
                border-bottom: 2px solid #e9ecef;
            }

            .page-title {
                font-size: 24px;
                color: #1a2a3a;
                font-weight: 700;
                margin: 0;
            }

            .page-title i {
                color: #4a6fa5;
                margin-right: 10px;
            }
            .page-subtitle {
                font-size: 13px;
                color: #8a9bb5;
                margin-top: 2px;
            }

            .card-custom {
                border: 1px solid #e9ecef;
                border-radius: 10px;
                box-shadow: 0 1px 4px rgba(0,0,0,0.04);
                background: #ffffff;
            }

            .card-custom .card-header {
                background: #f8fafc;
                border-bottom: 1px solid #e9ecef;
                padding: 14px 20px;
                font-weight: 600;
                font-size: 14px;
                color: #1a2a3a;
                border-radius: 10px 10px 0 0;
            }

            .card-custom .card-header i {
                color: #4a6fa5;
                margin-right: 8px;
            }
            .card-custom .card-body {
                padding: 30px 24px;
            }

          
            .winner-container {
                text-align: center;
                padding: 10px 0;
            }

            .winner-name {
                font-size: 28px;
                font-weight: 700;
                color: #0f7b3e;
                margin: 0 0 4px 0;
                letter-spacing: 0.5px;
            }

            .winner-label {
                font-size: 13px;
                color: #8a9bb5;
                text-transform: uppercase;
                letter-spacing: 1.5px;
                font-weight: 600;
                margin-bottom: 20px;
                display: block;
            }

            .stats-container {
                display: flex;
                justify-content: center;
                gap: 20px;
                flex-wrap: wrap;
                margin-top: 10px;
            }

            .stat-card {
                background: #f8fafc;
                border-radius: 8px;
                padding: 18px 28px;
                min-width: 170px;
                border: 1px solid #e9ecef;
                text-align: center;
            }

            .stat-card .stat-label {
                font-size: 12px;
                color: #8a9bb5;
                font-weight: 500;
                text-transform: uppercase;
                letter-spacing: 0.8px;
                margin-bottom: 4px;
            }

            .stat-card .stat-value {
                font-size: 26px;
                font-weight: 700;
                color: #1a2a3a;
            }

            .stat-card .stat-value.text-primary {
                color: #1a56db;
            }
            .stat-card .stat-value.text-success {
                color: #0f7b3e;
            }

            .stat-card i {
                font-size: 18px;
                margin-right: 6px;
                color: #8a9bb5;
            }

            .winner-detail {
                margin-top: 20px;
                color: #6c757d;
                font-size: 13px;
                padding: 10px 20px;
                background: #f8fafc;
                border-radius: 6px;
                display: inline-block;
                border-left: 3px solid #4a6fa5;
            }

            .winner-detail strong {
                color: #1a2a3a;
            }

            .empty-state {
                padding: 50px 20px;
                text-align: center;
                color: #8a9bb5;
            }

            .empty-state i {
                font-size: 48px;
                display: block;
                margin-bottom: 16px;
                color: #dce3ec;
            }

            .empty-state h5 {
                color: #4a5568;
                margin-bottom: 4px;
            }

            .btn-back {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                padding: 8px 18px;
                font-size: 13px;
                border-radius: 6px;
                font-weight: 500;
                color: #4a5568;
                border: 1px solid #dce3ec;
                background: #ffffff;
                text-decoration: none;
                transition: all 0.2s ease;
            }

            .btn-back:hover {
                background: #f1f3f5;
                color: #1a2a3a;
            }

            .btn-back i {
                font-size: 16px;
            }

            .badge-month {
                background: #ebf4ff;
                color: #1a56db;
                padding: 2px 12px;
                border-radius: 12px;
                font-size: 12px;
                font-weight: 600;
                margin-left: 8px;
            }

            .alert-custom {
                padding: 10px 16px;
                font-size: 13px;
                border-radius: 8px;
                margin-bottom: 16px;
            }

            .divider-line {
                width: 60px;
                height: 3px;
                background: #4a6fa5;
                margin: 8px auto 16px auto;
                border-radius: 2px;
            }

            @media (max-width: 768px) {
                .main-content {
                    padding: 16px;
                }
                .page-title {
                    font-size: 20px;
                }
                .card-custom .card-body {
                    padding: 20px;
                }
                .winner-name {
                    font-size: 22px;
                }
                .stat-card {
                    padding: 14px 18px;
                    min-width: 130px;
                }
                .stat-card .stat-value {
                    font-size: 20px;
                }
                .stats-container {
                    gap: 12px;
                }
                .winner-detail {
                    font-size: 12px;
                    padding: 8px 14px;
                }
            }
        </style>
    </head>
    <body>

        <div class="main-content">

            <div class="page-header-custom">
                <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
                    <div>
                        <h1 class="page-title"><i class="bi bi-bar-chart-fill"></i> Plan Más Vendido del Mes</h1>
                        <div class="page-subtitle">Plan con mayor número de membresías vendidas en el periodo actual</div>
                    </div>
                    <a href="Index.jsp" class="btn-back">
                        <i class="bi bi-arrow-left"></i> Volver al inicio
                    </a>
                </div>
            </div>

            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show alert-custom" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <div class="card-custom">
                <div class="card-header">
                    <i class="bi bi-trophy"></i> Resultado del Mes
                    <span class="badge-month">
                        <i class="bi bi-calendar3"></i> 
                        ${pageContext.request.locale.displayName}
                    </span>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty plan}">
                            <div class="empty-state">
                                <i class="bi bi-bar-chart"></i>
                                <h5>Sin ventas registradas</h5>
                                <p class="text-muted" style="font-size: 13px;">No se han registrado membresías vendidas en el mes actual.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="winner-container">
                                <!-- Etiqueta -->
                                <span class="winner-label">🏆 Plan Mas Vendido</span>

                                <!-- Nombre del plan -->
                                <div class="winner-name">${plan.nombrePlan}</div>

                                <!-- Línea decorativa -->
                                <div class="divider-line"></div>

                                <!-- Estadísticas -->
                                <div class="stats-container">
                                    <div class="stat-card">
                                        <div class="stat-label">
                                            <i class="bi bi-cart"></i> Cantidad
                                        </div>
                                        <div class="stat-value text-primary">${plan.cantidad}</div>
                                    </div>
                                    <div class="stat-card">
                                        <div class="stat-label">
                                            <i class="bi bi-cash-stack"></i> Recaudado
                                        </div>
                                        <div class="stat-value text-success">$${plan.totalRecaudado}</div>
                                    </div>
                                </div>

                                <!-- Detalle -->
                                <div class="winner-detail">
                                    <i class="bi bi-info-circle"></i> 
                                    El plan <strong>${plan.nombrePlan}</strong> lidera las ventas del mes con 
                                    <strong>${plan.cantidad}</strong> membresías, generando un total de 
                                    <strong>$${plan.totalRecaudado}</strong>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

        </div>

        <script>
            document.querySelectorAll('.sidebar .nav-item').forEach(function (item) {
                if (item.getAttribute('href') === 'ReporteControlador?accion=planMasVendido') {
                    item.classList.add('active');
                }
            });
        </script>

    </body>
</html>