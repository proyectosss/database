<div class="container-fluid contenido">
    <div class="row">
        <h3 class="text-center"> Equipos </h3>
    </div>
    <div class="table-responsive padding" >
        <table class="table">
            <thead class="heade-table">
            <th>Id</th>
            <th>Nombre</th>
            <th>Descripcion</th>
            </thead>
            <tbody>
                <?php foreach ($data as $item): ?>
                    <tr>
                        <td><?php echo $item['id']; ?></td>
                        <td><?php echo $item['nombre']; ?></td>
                        <td><?php echo $item['descripcion']; ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>
</div>
