<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado de Búsqueda - FitCIMM</title>

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

            .toolbar .btn-toolbar i {
                font-size: 15px;
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

            .badge-status {
                padding: 5px 14px;
                border-radius: 14px;
                font-size: 12px;
                font-weight: 700;
                display: inline-block;
                letter-spacing: 0.3px;
                text-transform: uppercase;
            }

            .badge-status.bg-success {
                background: #0f7b3e !important;
                color: #ffffff !important;
            }

            .badge-status.bg-danger {
                background: #dc2626 !important;
                color: #ffffff !important;
            }

            .badge-membresia.bg-success {
                background: #0f7b3e !important;
                color: #ffffff !important;
            }

            .badge-membresia.bg-warning {
                background: #d69e2e !important;
                color: #ffffff !important;
            }

            .badge-membresia.bg-danger {
                background: #dc2626 !important;
                color: #ffffff !important;
            }

            .badge-membresia.bg-secondary {
                background: #6c757d !important;
                color: #ffffff !important;
            }

            .badge-plan {
                display: inline-block;
                font-size: 11px;
                font-weight: 500;
                color: #1a2a3a;
                background: #e9ecef;
                padding: 2px 12px;
                border-radius: 10px;
                margin-top: 3px;
            }

            .table-container {
                background: #ffffff;
                border-radius: 10px;
                border: 1px solid #e9ecef;
                overflow: hidden;
                box-shadow: 0 1px 4px rgba(0,0,0,0.04);
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

            .btn-actions .btn-outline-info {
                color: #0891b2;
                border-color: #dce3ec;
            }

            .btn-actions .btn-outline-info:hover {
                background: #e6f7ff;
                border-color: #0891b2;
            }

            .alert-custom {
                padding: 10px 16px;
                font-size: 13px;
                border-radius: 8px;
                margin-bottom: 16px;
            }

            .count-badge {
                background: #ebf4ff;
                color: #1a56db;
                padding: 2px 12px;
                border-radius: 12px;
                font-size: 12px;
                font-weight: 600;
                margin-left: 8px;
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

            @media (max-width: 768px) {
                .main-content {
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
                .btn-actions .btn {
                    padding: 3px 6px;
                    font-size: 11px;
                }
                .btn-actions .btn i {
                    font-size: 12px;
                }
                .page-title {
                    font-size: 20px;
                }
                .badge-status {
                    font-size: 10px;
                    padding: 3px 10px;
                }
                .badge-plan {
                    font-size: 10px;
                    padding: 1px 10px;
                }
            }
        </style>
    </head>
    <body>

        <div class="main-content">

            <!-- Encabezado -->
            <div class="page-header-custom">
                <h1 class="page-title"><i class="bi bi-search"></i> Resultados de Búsqueda</h1>
                <div class="page-subtitle">Socios encontrados según los criterios de búsqueda</div>
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
                    <form action="SocioControlador" method="POST" style="display: flex; flex: 1; gap: 8px;">
                        <input type="text" name="busqueda" placeholder="Buscar por documento o apellido..." 
                               value="${param.busqueda}">
                        <button type="submit" class="btn btn-toolbar btn-outline-primary-toolbar" name="buscarSocio" value="buscar">
                            <i class="bi bi-search"></i> Buscar
                        </button>
                    </form>
                </div>
                <a href="SocioControlador?accion=listar" class="btn btn-toolbar btn-outline-secondary-toolbar">
                    <i class="bi bi-arrow-left"></i> Volver a la lista
                </a>
                <a href="Index.jsp#registrar" class="btn btn-toolbar btn-success-toolbar">
                    <i class="bi bi-person-plus"></i> Nuevo Socio
                </a>
            </div>

            <div class="result-info">
                <i class="bi bi-info-circle me-2"></i>
                <strong>${busqSocios.size()}</strong> resultado(s) encontrado(s)
                <c:if test="${not empty param.busqueda}">
                    para la búsqueda: "<strong>${param.busqueda}</strong>"
                </c:if>
            </div>

            <div class="table-container">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Documento</th>
                            <th>Email</th>
                            <th>Teléfono</th>
                            <th>Estado</th>
                            <th>Membresía</th>
                            <th>Días</th>
                            <th style="text-align: center;">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="socio" items="${busqSocios}">
                            <tr>

                                <td>
                                    <strong>${socio.nombres}</strong><br>
                                    <small class="text-muted">${socio.apellidos}</small>
                                </td>


                                <td>${socio.documento}</td>


                                <td>
                                    <c:choose>
                                        <c:when test="${not empty socio.correo}">${socio.correo}</c:when>
                                        <c:otherwise><span class="text-muted">—</span></c:otherwise>
                                    </c:choose>
                                </td>


                                <td>
                                    <c:choose>
                                        <c:when test="${not empty socio.telefono}">${socio.telefono}</c:when>
                                        <c:otherwise><span class="text-muted">—</span></c:otherwise>
                                    </c:choose>
                                </td>


                                <td>
                                    <span class="badge-status ${socio.activo ? 'bg-success' : 'bg-danger'}">
                                        ${socio.activo ? 'ACTIVO' : 'INACTIVO'}
                                    </span>
                                </td>


                                <td>
                                    <c:choose>
                                        <c:when test="${not empty socio.membresiaActual}">
                                            <span class="badge-status badge-membresia 
                                                  ${socio.membresiaActual.estado == 'VIGENTE' ? 'bg-success' : 
                                                    socio.membresiaActual.estado == 'POR_VENCER' ? 'bg-warning' : 'bg-danger'}">
                                                      ${socio.membresiaActual.estado}
                                                  </span>
                                                  <span class="badge-plan">${socio.membresiaActual.nombrePlan}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge-status badge-membresia bg-secondary">SIN MEMBRESÍA</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>


                                    <td style="text-align: center;">
                                        <c:choose>
                                            <c:when test="${not empty socio.membresiaActual && socio.membresiaActual.diasRestantes > 0}">
                                                <strong>${socio.membresiaActual.diasRestantes}</strong>
                                                <small class="text-muted d-block" style="font-size: 10px;">días</small>
                                            </c:when>
                                            <c:when test="${not empty socio.membresiaActual && socio.membresiaActual.diasRestantes == 0}">
                                                <span class="text-warning" style="font-weight: 600;">Hoy</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-muted">—</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>


                                    <td style="text-align: center;">
                                        <div class="btn-actions">
                                            <form action="SocioControlador" method="POST" style="display: inline;">
                                                <input type="hidden" name="id" value="${socio.id_socio}" />
                                                <button type="submit" name="Editar" value="editar" class="btn btn-outline-primary btn-sm" title="Editar socio">
                                                    <i class="bi bi-pencil"></i>
                                                </button>
                                                <button type="submit" name="Eliminar" value="eliminar" class="btn btn-outline-danger btn-sm"
                                                        onclick="return confirm('¿Está seguro de inactivar este socio?');" title="Inactivar socio">
                                                    <i class="bi bi-person-x"></i>
                                                </button>
                                            </form>

                                            <a href="SocioControlador?accion=detalle&id=${socio.id_socio}" 
                                               class="btn btn-outline-info btn-sm" title="Ver historial de membresías">
                                                <i class="bi bi-eye"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            <c:if test="${empty busqSocios}">
                                <tr>
                                    <td colspan="8" class="text-center py-4 text-muted">
                                        <i class="bi bi-search" style="font-size: 24px; display: block; margin-bottom: 8px;"></i>
                                        No se encontraron socios con los criterios de búsqueda
                                        <c:if test="${not empty param.busqueda}">
                                            <br><small>para: "<strong>${param.busqueda}</strong>"</small>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>

                <div class="mt-3 text-muted" style="font-size: 13px;">
                    <i class="bi bi-people"></i> 
                    <strong>${busqSocios.size()}</strong> socios encontrados
                    <c:if test="${not empty busqSocios}">
                        <span class="count-badge">
                            <i class="bi bi-check-circle-fill" style="font-size: 10px;"></i>
                            <c:set var="activos" value="0" />
                            <c:forEach var="socio" items="${busqSocios}">
                                <c:if test="${socio.activo}">
                                    <c:set var="activos" value="${activos + 1}" />
                                </c:if>
                            </c:forEach>
                            ${activos} activos
                        </span>
                    </c:if>
                </div>

            </div>

            <script>
                document.querySelectorAll('.sidebar .nav-item').forEach(item => {
                    if (item.getAttribute('href') === 'SocioControlador?accion=listar') {
                        item.classList.add('active');
                    }
                });
            </script>

        </body>
    </html>