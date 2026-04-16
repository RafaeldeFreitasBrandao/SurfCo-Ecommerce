let title = document.querySelectorAll(".accordion .item .title");

title.forEach(title => {
    title.addEventListener("click", function () {
        // Obtém o item pai correspondente ao título clicado
        let item = this.parentElement;

        // Verifica se já existe um item ativo
        let activeNode = document.querySelector(".accordion .item.active");

        // Se houver um item ativo e não for o atual, remove a classe
        if (activeNode && activeNode !== item) {
            activeNode.classList.remove("active");
        }

        // Alterna o estado do item clicado
        item.classList.toggle("active");
    });
});



