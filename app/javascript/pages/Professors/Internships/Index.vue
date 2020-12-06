<template>
  <div class="container-fluid mb-5">
    <Header :professor="professor" />
    <div class="row mt-5">
      <div class="col"></div>
      <div class="col-lg-11">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th class="text-center" scope="col">#</th>
              <th class="text-center" scope="col">Cargo</th>
              <th class="text-center" scope="col">Empresa</th>
              <th class="text-center" scope="col">Remuneração</th>
              <th class="text-center" scope="col">Criado em</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="internship in internships" :key="internship.id">
              <th class="text-center" scope="row">{{ internship.id }}</th>
              <td class="text-center">{{ internship.occupation }}</td>
              <td class="text-center">{{ internship.institution }}</td>
              <td class="text-center">
                {{ formatter.format(internship.remuneration) }}
              </td>
              <td class="text-center">
                {{ new Date(internship.created_at).toLocaleString() }}
              </td>
              <td class="text-center m-0 px-0">
                <inertia-link
                  :href="`/professors/internships/${internship.id}`"
                  class="btn btn-outline-primary ml-2"
                  >Editar</inertia-link
                >
                <button
                  class="btn btn-outline-danger"
                  @click="destroy(internship.id)"
                >
                  Excluir
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="col"></div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Header from "@/components/Header.vue";

export default {
  props: ["internships", "professor"],
  components: { Header },
  data: () => ({
    formatter: new Intl.NumberFormat("pt-BR", {
      style: "currency",
      currency: "BRL",
    }),
  }),
  methods: {
    destroy(id) {
      let conf = confirm("Realmente deseja deletar este estágio?");
      if (!conf) return;

      axios.delete(`/professors/internships/${id}`).then((response) => {
        if (response.data.status) {
          this.$toast.success("Estágio excluido com sucesso!");
        }

        this.$toast.error(
          "Não foi possivel excluir este estágio, tente novamente"
        );
      });
    },
  },
};
</script>