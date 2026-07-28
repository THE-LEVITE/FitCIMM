<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Plan - FitCIMM</title>
        
        <jsp:include page="header.jsp" />
        
        <style>
            .main-content { padding: 30px 40px; }
            
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
            
            .page-title i { color: #4a6fa5; margin-right: 10px; }
            .page-subtitle { font-size: 13px; color: #8a9bb5; margin-top: 2px; }
            
            .card-form {
                border: 1px solid #e9ecef;
                border-radius: 10px;
                box-shadow: 0 1px 4px rgba(0,0,0,0.04);
                background: #ffffff;
                max-width: 700px;
            }
            
            .card-form .card-header {
                background: #f8fafc;
                border-bottom: 1px solid #e9ecef;
                padding: 14px 24px;
                font-weight: 600;
                font-size: 15px;
                color: #1a2a3a;
                border-radius: 10px 10px 0 0;
            }
            
            .card-form .card-header i { color: #4a6fa5; margin-right: 8px; }
            .card-form .card-body { padding: 28px 30px; }
            
            .form-control-lg-custom {
                padding: 10px 16px;
                font-size: 14px;
                height: 44px;
                border-radius: 6px;
                border: 1px solid #e2e8f0;
                transition: all 0.2s ease;
            }
            
            .form-control-lg-custom:focus {
                border-color: #4a6fa5;
                box-shadow: 0 0 0 3px rgba(74, 111, 165, 0.12);
                outline: none;
            }
            
            .form-label {
                font-size: 13px;
                font-weight: 500;
                color: #2d3748;
                margin-bottom: 4px;
            }
            
            .mb-3 { margin-bottom: 16px !important; }
            
            .btn-guardar {
                padding: 10px 32px;
                font-size: 14px;
                border-radius: 6px;
                font-weight: 600;
                height: 44px;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                background: #0f7b3e;
                border-color: #0f7b3e;
                color: #fff;
                transition: all 0.25s ease;
                border: none;
                cursor: pointer;
            }
            
            .btn-guardar:hover {
                background: #0a6933;
                border-color: #0a6933;
                color: #fff;
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(15, 123, 62, 0.25);
            }
            
            .btn-guardar i { font-size: 16px; }
            
            .btn-cancelar {
                padding: 10px 32px;
                font-size: 14px;
                border-radius: 6px;
                font-weight: 600;
                height: 44px;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                background: #6c757d;
                border-color: #6c757d;
                color: #fff;
                transition: all 0.25s ease;
                border: none;
                cursor: pointer;
                text-decoration: none;
            }
            
            .btn-cancelar:hover {
                background: #5a6268;
                border-color: #5a6268;
                color: #fff;
                text-decoration: none;
            }
            
            .btn-cancelar i { font-size: 16px; }
            
            .alert-custom {
                padding: 10px 16px;
                font-size: 13px;
                border-radius: 8px;
                margin-bottom: 16px;
            }
            
            @media (max-width: 768px) {
                .main-content { padding: 16px; }
                .card-form .card-body { padding: 18px; }
                .card-form { max-width: 100%; }
                .form-control-lg-custom { height: 40px; font-size: 13px; }
                .btn-guardar, .btn-cancelar { height: 40px; padding: 8px 20px; font-size: 13px; }
                .page-title { font-size: 20px; }
            }
        </style>
    </head>
    <body>
        
        <div class="main-content">
            
            <div class="page-header-custom">
                <h1 class="page-title"><i class="bi bi-pencil-square"></i> Editar Plan</h1>
                <div class="page-subtitle">Modificar la información del plan seleccionado</div>
            </div>
            
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show alert-custom" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            
            <div class="card card-form">
                <div class="card-header">
                    <i class="bi bi-card-list"></i> Datos del Plan
                </div>
                <div class="card-body">
                    <form action="PlanControlador" method="POST">
                        <input type="hidden" name="accion" value="guardar">
                        <input type="hidden" name="idEdit" value="${idEdit}">
                        
                        <div class="mb-3">
                            <label class="form-label">Nombre del Plan *</label>
                            <input type="text" name="nombreEdit" class="form-control form-control-lg-custom" 
                                   value="${nombreEdit}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Duración (días) *</label>
                            <input type="number" name="duracionEdit" class="form-control form-control-lg-custom" 
                                   value="${duracionEdit}" required min="1" max="365">
                            <small class="text-muted" style="font-size: 12px;">La duración debe estar entre 1 y 365 días</small>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Valor ($) *</label>
                            <input type="number" name="valorEdit" class="form-control form-control-lg-custom" 
                                   value="${valorEdit}" required min="1">
                            <small class="text-muted" style="font-size: 12px;">El valor debe ser mayor a 0</small>
                        </div>
                        
                        <div class="d-flex gap-2">
                            <button type="submit" class="btn-guardar">
                                <i class="bi bi-check-circle"></i> Guardar Cambios
                            </button>
                            <a href="PlanControlador?accion=listarPlan" class="btn-cancelar">
                                <i class="bi bi-x-circle"></i> Cancelar
                            </a>
                        </div>
                    </form>
                </div>
            </div>
            
        </div>
        
        <script>
            document.querySelectorAll('.sidebar .nav-item').forEach(function(item) {
                if (item.getAttribute('href') === 'PlanControlador?accion=listarPlan') {
                    item.classList.add('active');
                }
            });
        </script>
        
    </body>
</html>