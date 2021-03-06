select.rule <-
function (x, type = 0, epsilon = 1, thresh = 1) 
{
    z <- rep(0, length(x))
    if (type == 0) {
        z <- z
        select <- rep(1, length(x))
    }
    if (type == 1) {
        max.pos <- which.max(x)
        z[-as.numeric(max.pos)] <- -Inf
        select <- rep(0, times = length(x))
        select[as.numeric(max.pos)] <- 1
    }
    if (type == 2) {
        max.pos1 <- which.max(x)
        x[as.numeric(max.pos1)] <- -Inf
        max.pos2 <- which.max(x)
        z[-c(as.numeric(max.pos1), as.numeric(max.pos2))] <- -Inf
        select <- rep(0, times = length(x))
        select[c(as.numeric(max.pos1), as.numeric(max.pos2))] <- 1
    }
    if (type == 3) {
        max.pos1 <- which.max(x)
        x[as.numeric(max.pos1)] <- -Inf
        max.pos2 <- which.max(x)
        x[as.numeric(max.pos2)] <- -Inf
        max.pos3 <- which.max(x)
        z[-c(as.numeric(max.pos1), as.numeric(max.pos2), as.numeric(max.pos3))] <- -Inf
        select <- rep(0, times = length(x))
        select[c(as.numeric(max.pos1), as.numeric(max.pos2), 
            as.numeric(max.pos3))] <- 1
    }
    if (type == 4) {
        max.ind <- max(x) - epsilon
        max.pos <- which(x >= max.ind - 0.00001, arr.ind = TRUE) # added - 0.00001
        z[-as.numeric(max.pos)] <- -Inf
        select <- rep(0, times = length(x))
        select[as.numeric(max.pos)] <- 1
    }
    if (type == 5) {
        max.pos <- sample(1:length(x), 1)
        z[-as.numeric(max.pos)] <- -Inf
        select <- rep(0, times = length(x))
        select[as.numeric(max.pos)] <- 1
    }
    if (type == 6) {
        max.pos <- which(x >= thresh, arr.ind = TRUE)
        if(sum(max.pos) == 0){
            z[c(1:length(x))] <- -Inf
        }else{
            z[-as.numeric(max.pos)] <- -Inf
        }
        select <- rep(0, times = length(x))
        if(sum(max.pos) > 0){
            select[as.numeric(max.pos)] <- 1
        }
    }
    if (type == 7) {
        max.pos <- which.max(x)
        select <- rep(0, times = length(x))
        if(x[max.pos] >= thresh){
            z[-as.numeric(max.pos)] <- -Inf
            select[as.numeric(max.pos)] <- 1
        }else{
            z[1:length(x)] <- -Inf
        }
    }
    if (type == 8) {
        max.pos <- which.max(x[-which.max(x)])
        z[-as.numeric(max.pos)] <- -Inf
        select <- rep(0, times = length(x))
        select[as.numeric(max.pos)] <- 1
    }
    if (type == 9) {
        max.pos <- which.max(x[-which.max(x)])
        select <- rep(0, times = length(x))
        if(x[max.pos] >= thresh){
            z[-as.numeric(max.pos)] <- -Inf
            select[as.numeric(max.pos)] <- 1
        }else{
            z[1:length(x)] <- -Inf
        }
    }
    if (type == 10) {
        max.ind <- max(x) - epsilon
        max.pos <- which(x >= max.ind - 0.00001 & x >= thresh, arr.ind = TRUE) # added - 0.00001
        select <- rep(0, times = length(x))
        z[-as.numeric(max.pos)] <- -Inf
        select[as.numeric(max.pos)] <- 1
    }
    list(select = select, z = z)
}
