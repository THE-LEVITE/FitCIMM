<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vender Membresía - FitCIMM</title>
        
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
            
            .btn-vender {
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
            
            .btn-vender:hover {
                background: #0a6933;
                border-color: #0a6933;
                color: #fff;
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(15, 123, 62, 0.25);
            }
            
            .btn-vender i { font-size: 16px; }
            
            .alert-custom {
                padding: 10px 16px;
                font-size: 13px;
                border-radius: 8px;
                margin-bottom: 16px;
            }
            
            .form-text-custom {
                font-size: 12px;
                color: #8a9bb5;
            }
            
            @media (max-width: 768px) {
                .main-content { padding: 16px; }
                .card-form .card-body { padding: 18px; }
                .card-form { max-width: 100%; }
                .form-control-lg-custom { height: 40px; font-size: 13px; }
                .btn-vender { height: 40px; padding: 8px 20px; font-size: 13px; }
                .page-title { font-size: 20px; }
            }
        </style>
    </head>
    <body>
        
        <div class="main-content">
            
            <div class="page-header-custom">
                <h1 class="page-title"><i class="bi bi-ticket"></i> Vender Membresía</h1>
                <div class="page-subtitle">Registrar la venta de una nueva membresía a un socio</div>
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
                    <i class="bi bi-person-badge"></i> Datos de la Membresía
                </div>
                <div class="card-body">
                    <form action="MembresiaControlador" method="POST">
                        <input type="hidden" name="accion" value="registrar">
                        
                        <div class="mb-3">
                            <label class="form-label">Socio *</label>
                            <select class="form-select form-control-lg-custom" name="id_socio" required>
                                <option value="">Seleccione un socio...</option>
                                <c:forEach var="socio" items="${listaSocios}">
                                    <option value="${socio.id_socio}">
                                        ${socio.nombres} ${socio.apellidos} - ${socio.documento}
                                    </option>
                                </c:forEach>
                            </select>
                            <small class="form-text-custom">Seleccione el socio al que se le venderá la membresía</small>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Plan *</label>
                            <select class="form-select form-control-lg-custom" name="id_plan" required>
                                <option value="">Seleccione un plan...</option>
                                <c:forEach var="plan" items="${listPlan}">
                                    <option value="${plan.id_Plan}">
                                        ${plan.nombre} - $${plan.valor} (${plan.duracion_dias} días)
                                    </option>
                                </c:forEach>
                            </select>
                            <small class="form-text-custom">Seleccione el plan que desea vender</small>
                        </div>
                        
                        <button type="submit" class="btn-vender">
                            <i class="bi bi-check-circle"></i> Vender Membresía
                        </button>
                    </form>
                </div>
            </div>
            
        </div>
        
        <script>
            document.querySelectorAll('.sidebar .nav-item').forEach(function(item) {
                if (item.getAttribute('href') === 'MembresiaControlador?accion=nuevo') {
                    item.classList.add('active');
                }
            });
        </script>
        
    </body>
</html>