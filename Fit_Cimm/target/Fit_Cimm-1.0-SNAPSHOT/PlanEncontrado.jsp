<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultados de Búsqueda - FitCIMM</title>

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
                padding: 20px 24px;
            }

            .table-container {
                overflow-x: auto;
            }

            .table-container .table {
                margin-bottom: 0;
                font-size: 13.5px;
            }

            .table-container .table thead th {
                background: #f8fafc;
                color: #1a2a3a;
                font-weight: 600;
                font-size: 12.5px;
                text-transform: uppercase;
                letter-spacing: 0.3px;
                padding: 12px 14px;
                border-bottom: 2px solid #e9ecef;
                white-space: nowrap;
            }

            .table-container .table tbody td {
                padding: 11px 14px;
                vertical-align: middle;
                border-bottom: 1px solid #f0f2f5;
            }

            .table-container .table tbody tr:hover {
                background: #f8fafc;
            }
            .table-container .table tbody tr:last-child td {
                border-bottom: none;
            }

            .badge-count {
                background: #ebf4ff;
                color: #1a56db;
                padding: 2px 12px;
                border-radius: 12px;
                font-size: 12px;
                font-weight: 600;
                margin-left: 8px;
            }

            .btn-actions {
                display: flex;
                gap: 4px;
                justify-content: center;
            }
            .btn-actions .btn {
                padding: 4px 8px;
                font-size: 13px;
                border-radius: 4px;
                line-height: 1;
            }
            .btn-actions .btn i {
                font-size: 14px;
            }

            .btn-actions .btn-outline-primary {
                color: #4a6fa5;
                border-color: #dce3ec;
            }
            .btn-actions .btn-outline-primary:hover {
                background: #ebf4ff;
                border-color: #4a6fa5;
            }

            .btn-actions .btn-outline-danger {
                color: #dc2626;
                border-color: #dce3ec;
            }
            .btn-actions .btn-outline-danger:hover {
                background: #fef2f2;
                border-color: #dc2626;
            }

            .toolbar {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
                align-items: center;
                margin-bottom: 20px;
                padding: 14px 20px;
                background: #ffffff;
                border-radius: 10px;
                border: 1px solid #e9ecef;
            }

            .toolbar .search-box {
                display: flex;
                flex: 1;
                gap: 8px;
                min-width: 250px;
            }

            .toolbar .search-box input {
                height: 38px;
                padding: 8px 14px;
                font-size: 13px;
                border-radius: 6px;
                border: 1px solid #e2e8f0;
                flex: 1;
                transition: all 0.2s ease;
            }

            .toolbar .search-box input:focus {
                border-color: #4a6fa5;
                box-shadow: 0 0 0 3px rgba(74, 111, 165, 0.12);
                outline: none;
            }

            .toolbar .btn-toolbar {
                height: 38px;
                padding: 0 18px;
                font-size: 13px;
                border-radius: 6px;
                font-weight: 500;
                display: inline-flex;
                align-items: center;
                gap: 6px;
                white-space: nowrap;
            }

            .btn-success-toolbar {
                background: #0f7b3e;
                border-color: #0f7b3e;
                color: #fff;
            }

            .btn-success-toolbar:hover {
                background: #0a6933;
                border-color: #0a6933;
                color: #fff;
            }

            .btn-outline-primary-toolbar {
                color: #4a6fa5;
                border-color: #dce3ec;
            }

            .btn-outline-primary-toolbar:hover {
                background: #ebf4ff;
                border-color: #4a6fa5;
            }

            .btn-outline-secondary-toolbar {
                color: #6c757d;
                border-color: #dce3ec;
            }

            .btn-outline-secondary-toolbar:hover {
                background: #f1f3f5;
                border-color: #6c757d;
            }

            .empty-state {
                padding: 40px 20px;
                text-align: center;
                color: #8a9bb5;
            }
            .empty-state i {
                font-size: 48px;
                display: block;
                margin-bottom: 12px;
                color: #dce3ec;
            }
            .empty-state h5 {
                color: #4a5568;
                margin-bottom: 4px;
            }

            .result-info {
                background: #f8fafc;
                padding: 8px 16px;
                border-radius: 6px;
                font-size: 13px;
                color: #4a5568;
                margin-bottom: 16px;
                border-left: 3px solid #4a6fa5;
            }

            .alert-custom {
                padding: 10px 16px;
                font-size: 13px;
                border-radius: 8px;
                margin-bottom: 16px;
            }

            @media (max-width: 768px) {
                .main-content {
                    padding: 16px;
                }
                .card-custom .card-body {
                    padding: 16px;
                }
                .toolbar {
                    flex-direction: column;
                    align-items: stretch;
                }
                .toolbar .search-box {
                    min-width: auto;
                }
                .table-container .table {
                    font-size: 12px;
                }
                .table-container .table thead th,
                .table-container .table tbody td {
                    padding: 8px 10px;
                }
                .page-title {
                    font-size: 20px;
                }
                .btn-actions .btn {
                    padding: 3px 6px;
                    font-size: 11px;
                }
                .btn-actions .btn i {
                    font-size: 12px;
                }
            }
        </style>
    </head>
    <body>

        <div class="main-content">

            <div class="page-header-custom">
                <h1 class="page-title"><i class="bi bi-search"></i> Resultados de Búsqueda</h1>
                <div class="page-subtitle">Planes encontrados según los criterios de búsqueda</div>
            </div>

            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show alert-custom" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <div class="toolbar">
                <div class="search-box">
                    <form action="PlanControlador" method="POST" style="display: flex; flex: 1; gap: 8px;">
                        <input type="text" name="busqueda" placeholder="Buscar plan por nombre..." value="${param.busqueda}">
                        <button type="submit" class="btn btn-toolbar btn-outline-primary-toolbar" name="accion" value="buscar">
                            <i class="bi bi-search"></i> Buscar
                        </button>
                    </form>
                </div>
                <a href="PlanControlador?accion=listarPlan" class="btn btn-toolbar btn-outline-secondary-toolbar">
                    <i class="bi bi-arrow-left"></i> Volver a la lista
                </a>
                <a href="Planes.jsp" class="btn btn-toolbar btn-success-toolbar">
                    <i class="bi bi-plus-circle"></i> Nuevo Plan
                </a>
            </div>

            <div class="result-info">
                <i class="bi bi-info-circle me-2"></i>
                <strong>${busqPlan.size()}</strong> resultado(s) encontrado(s)
                <c:if test="${not empty param.busqueda}">
                    para la búsqueda: "<strong>${param.busqueda}</strong>"
                </c:if>
            </div>

            <div class="card-custom">
                <div class="card-header">
                    <i class="bi bi-list"></i> Planes Encontrados
                    <span class="badge-count">${busqPlan.size()} planes</span>
                </div>
                <div class="card-body p-0">
                    <c:choose>
                        <c:when test="${not empty busqPlan}">
                            <div class="table-container">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre</th>
                                            <th>Duración</th>
                                            <th>Valor</th>
                                            <th style="text-align: center;">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="Plan" items="${busqPlan}" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td><strong>${Plan.nombre}</strong></td>
                                                <td>${Plan.duracion_dias} días</td>
                                                <td><strong>$${Plan.valor}</strong></td>
                                                <td style="text-align: center;">
                                                    <div class="btn-actions">
                                                        <form action="PlanControlador" method="POST">
                                                            <input type="hidden" name="id" value="${Plan.id_Plan}" />
                                                            <button type="submit" name="accion" value="editar" class="btn btn-outline-primary btn-sm" title="Editar">
                                                                <i class="bi bi-pencil"></i>
                                                            </button>
                                                            <button type="submit" name="accion" value="eliminar" class="btn btn-outline-danger btn-sm" 
                                                                    onclick="return confirm('¿Está seguro de eliminar este plan?');" title="Eliminar">
                                                                <i class="bi bi-trash"></i>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="empty-state">
                                <i class="bi bi-search"></i>
                                <h5>No se encontraron planes</h5>
                                <p class="text-muted" style="font-size: 13px;">No hay planes que coincidan con los criterios de búsqueda.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

        </div>

        <script>
            document.querySelectorAll('.sidebar .nav-item').forEach(function (item) {
                if (item.getAttribute('href') === 'PlanControlador?accion=listarPlan') {
                    item.classList.add('active');
                }
            });
        </script>

    </body>
</html> 