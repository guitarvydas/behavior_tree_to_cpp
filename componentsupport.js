function formatName (s) {
    return s.trim ().replace (/%22/g,"\"");
}

exports.formatInputs = function (s) {
    return formatName (s);
}

exports.formatOutputs = function (s) {
    return formatName (s);
}

exports.namify = function (s) {
    return formatName (s);
}
