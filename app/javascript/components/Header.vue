<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-light pb-1">
      <div class="container-fluid">
        <inertia-link class="navbar-brand text-primary my-0" href="/">
          <img
            src="https://unisalesiano.com.br/aracatuba/wp-content/themes/unisalesiano/img/logo.svg"
            style="width: 230px; display: block"
          />
        </inertia-link>
        <button
          class="navbar-toggler navbar-toggler-right border-0"
          type="button"
          data-toggle="collapse"
          data-target="#navbar5"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar5">
          <ul class="navbar-nav ml-auto">
            <div v-if="!student && !professor" class="nav-item my-1">
              <li class="nav-item my-1 d-inline">
                <inertia-link
                  class="btn navbar-btn ml-md-2 btn-outline-danger"
                  href="/students/credentials"
                >
                  Área do Aluno
                </inertia-link>
              </li>
              <li class="nav-item my-1 d-inline">
                <inertia-link
                  class="btn navbar-btn ml-md-2 btn-outline-danger"
                  href="/professors/credentials"
                >
                  Área do Professor
                </inertia-link>
              </li>
            </div>
            <div class="nav-item my-1" v-if="student || professor">
              <div class="nav-item my-1 dropdown d-inline ml-2">
                <button
                  class="btn btn-outline-danger dropdown-toggle"
                  type="button"
                  id="dropdownMenuButton"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  Estágios
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <inertia-link
                    class="dropdown-item"
                    href="/professors/internships"
                    >Todos os Estágios</inertia-link
                  >
                  <inertia-link
                    class="dropdown-item"
                    href="/professors/internships/new"
                    >Novo Estágio</inertia-link
                  >
                </div>
              </div>
            </div>
            <li class="nav-item my-1" v-if="student || professor">
              <button
                class="btn navbar-btn ml-md-2 btn-outline-danger"
                @click="logout"
              >
                Deslogar
              </button>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <hr class="w-100 mt-0 mb-0" />
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Header",
  props: ["student", "professor"],
  methods: {
    logout() {
      axios.delete("/students/:id").then((response) => {
        top.location.href = "/";
      });
    },
  },
};
</script>