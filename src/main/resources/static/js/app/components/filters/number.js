app.filter('number', function () {
    return function (input) {
        return (input === null || input === undefined || input == '') ? '0.00' : input.toFixed(2);
    };
});