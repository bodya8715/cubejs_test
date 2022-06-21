cube(`Users`, {
  sql: `SELECT * FROM users`,

  joins: {
    Orders: {
      relationship: `hasMany`,
      sql: `${Users}.id = ${Orders}."userId"`,
    },
  },

  dimensions: {
    user_id: {
      type: `string`,
      sql: `${Users}."id"`,
      primaryKey: true,
    },
    created_at: {
      type: `time`,
      sql: `${Orders}."createdAt"`,
    },
    userId: {
      type: `string`,
      sql: `${Orders}."userId"`,
    },

    first_name: {
      type: `string`,
      sql: `${Users}."first_name"`,
    },
    last_name: {
      type: `string`,
      sql: `${Users}."last_name"`,
    },
    life_time: {
      type: `number`,
      sql: `${Users}."life_time"`,
    },
  },
});
