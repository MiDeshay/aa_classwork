export const fetchBenches = () => (
    $.ajax({
        method: "GET",
        url: "/api/benches"
    })
)