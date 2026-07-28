<%-- 
    header.jsp - Componente reutilizable con menú lateral
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

<style>

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    body {
        background-color: #f5f7fa;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .sidebar {
        height: 100vh;
        position: fixed;
        top: 0;
        left: 0;
        width: 240px;
        background: #ffffff;
        padding-top: 0;
        color: #2d3748;
        overflow-y: auto;
        z-index: 1000;
        box-shadow: 2px 0 12px rgba(0,0,0,0.06);
        border-right: 1px solid #e9ecef;
        transition: all 0.3s ease;
    }

    .sidebar .brand {
        padding: 24px 20px 20px 20px;
        border-bottom: 1px solid #e9ecef;
        background: #1a2a3a;
    }

    .sidebar .brand h3 {
        color: #ffffff;
        font-weight: 700;
        font-size: 20px;
        margin: 0;
        letter-spacing: 0.5px;
    }

    .sidebar .brand h3 i {
        color: #f6c445;
        margin-right: 8px;
    }

    .sidebar .brand small {
        color: #8a9bb5;
        display: block;
        font-size: 11px;
        font-weight: 400;
        margin-top: 2px;
        letter-spacing: 0.3px;
    }

    .sidebar .nav-section {
        padding: 18px 20px 6px 20px;
        font-size: 10px;
        text-transform: uppercase;
        color: #a0aec0;
        letter-spacing: 0.8px;
        font-weight: 700;
    }

    .sidebar .nav-item {
        display: flex;
        align-items: center;
        padding: 9px 20px;
        color: #4a5568;
        text-decoration: none;
        transition: all 0.2s ease;
        font-size: 13.5px;
        font-weight: 500;
        border-left: 3px solid transparent;
        margin: 1px 8px;
        border-radius: 6px;
    }

    .sidebar .nav-item:hover {
        background: #f0f4f9;
        color: #1a2a3a;
        border-left-color: #f6c445;
    }

    .sidebar .nav-item.active {
        background: #ebf4ff;
        color: #1a56db;
        border-left-color: #1a56db;
        font-weight: 600;
    }

    .sidebar .nav-item i {
        margin-right: 12px;
        font-size: 17px;
        width: 22px;
        text-align: center;
        color: #718096;
    }

    .sidebar .nav-item.active i {
        color: #1a56db;
    }
    .sidebar .nav-item:hover i {
        color: #2d3748;
    }

    .main-content {
        margin-left: 240px;
        padding: 28px 35px;
        min-height: 100vh;
    }

    @media (max-width: 768px) {
        .sidebar {
            width: 60px;
        }
        .sidebar .brand h3,
        .sidebar .brand small,
        .sidebar .nav-section,
        .sidebar .nav-item span {
            display: none;
        }
        .sidebar .nav-item {
            padding: 12px 0;
            justify-content: center;
            margin: 2px 4px;
        }
        .sidebar .nav-item i {
            margin-right: 0;
            font-size: 19px;
            width: auto;
        }
        .main-content {
            margin-left: 60px;
            padding: 16px;
        }
    }
</style>

<div class="sidebar">

    <div class="brand">
        <h3><i class="bi bi-dumbbell"></i> FitCIMM</h3>
        <small>Gimnasio · Paipa</small>
    </div>

    <div class="nav-section">Socios</div>
    <a href="SocioControlador?accion=listar" class="nav-item" id="menu-listar">
        <i class="bi bi-people"></i> <span>Listar Socios</span>
    </a>
    <a href="Index.jsp#registrar" class="nav-item" id="menu-registrar">
        <i class="bi bi-person-plus"></i> <span>Registrar Socio</span>
    </a>

    <div class="nav-section">Planes</div>
    <a href="PlanControlador?accion=listarPlan" class="nav-item" id="menu-planes">
        <i class="bi bi-card-list"></i> <span>Listar Planes</span>
    </a>
    <a href="Planes.jsp" class="nav-item" id="menu-crear-plan">
        <i class="bi bi-plus-circle"></i> <span>Crear Plan</span>
    </a>

    <div class="nav-section">Membresías</div>
    <a href="MembresiaControlador?accion=nuevo" class="nav-item" id="menu-vender">
        <i class="bi bi-ticket"></i> <span>Vender Membresía</span>
    </a>
    <a href="MembresiaControlador?accion=listar" class="nav-item" id="menu-listar-membresias">
        <i class="bi bi-list"></i> <span>Listar Membresías</span>
    </a>
    <a href="MembresiaControlador?accion=porVencer" class="nav-item" id="menu-por-vencer">
        <i class="bi bi-exclamation-triangle"></i> <span>Por Vencer</span>
    </a>

    <div class="nav-section">Control de Ingreso</div>
    <a href="SocioControlador?accion=ingresar" class="nav-item" id="menu-ingreso">
        <i class="bi bi-door-open"></i> <span>Registrar Ingreso</span>
    </a>

    <div class="nav-section">Reportes</div>
    <a href="ReporteControlador?accion=sociosVigentes" class="nav-item" id="menu-rf15">
        <i class="bi bi-people"></i> <span>Socios Vigentes</span>
    </a>
    <a href="ReporteControlador?accion=recaudo" class="nav-item" id="menu-rf16">
        <i class="bi bi-cash-stack"></i> <span>Recaudo por Plan</span>
    </a>
    <a href="ReporteControlador?accion=planMasVendido" class="nav-item" id="menu-rf17">
        <i class="bi bi-trophy"></i> <span>Plan más Vendido</span>
    </a>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var currentPath = window.location.pathname + window.location.search;
        document.querySelectorAll('.sidebar .nav-item').forEach(function (item) {
            var href = item.getAttribute('href');
            if (href && currentPath.includes(href)) {
                item.classList.add('active');
            }
        });
    });
</script>