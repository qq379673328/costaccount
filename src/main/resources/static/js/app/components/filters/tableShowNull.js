
app.filter('tableShowNull', function () {
    return function (input) {
        return (input === null 
        		|| input === undefined
        		|| input == ""
        		) ? "-" : input;
    };
});