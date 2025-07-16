$(function () {
    let tags = [];
    let warnings = [];

    function refreshTags() {
      $("#tags-list").empty();
      $("#tags-hidden").val(tags.join(","));
      tags.forEach((tag, i) => {
        $("#tags-list").append(
          `<span class="badge bg-info text-dark me-1 mb-1">
            ${tag}
            <button type="button" class="btn-close btn-close-white btn-sm ms-2" aria-label="Remove" onclick="removeTag(${i})"></button>
          </span>`
        );
      });
    }

    function refreshWarnings() {
      $("#warnings-list").empty();
      warnings.forEach((val, i) => {
        $("#warnings-list").append(`
          <div class="warning-item">
            <input type="text" class="form-control" name="warnings" value="${val}" placeholder="e.g. Suspend broken">
            <button type="button" class="btn btn-outline-danger btn-sm" onclick="removeWarning(${i})">Remove</button>
          </div>`);
      });
    }

    $("#add-tag-btn").click(() => {
      const selected = $("#tag-category").val();
      if (selected && !tags.includes(selected)) {
        tags.push(selected);
        refreshTags();
      }
    });

    window.removeTag = function (i) {
      tags.splice(i, 1);
      refreshTags();
    };

    $("#add-warning-btn").click(() => {
      warnings.push("");
      refreshWarnings();
    });

    window.removeWarning = function (i) {
      warnings.splice(i, 1);
      refreshWarnings();
    };
  });