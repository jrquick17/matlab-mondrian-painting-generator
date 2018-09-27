% Script P1_3
% Painting

clc

close all
figure
axis equal off
hold on

N = 40;

xBoard = 100000;
yBoard = 100000;

xMin = xBoard / 4;
yMin = yBoard / 4;

xMax = xBoard / 2;
yMax = yBoard / 2;

xs = [0 xBoard xBoard 0];
ys = [0 0 yBoard yBoard];

f = fill(xs, ys, white);

for x=1:N
    if (mod(x, 2) == 0)
        xLeft = random('Uniform', 0, xBoard - xMax);
        xRight = random('Uniform', xLeft, xLeft+yMax);
    else
        xRight = random('Uniform', 0 + xMax, xBoard);
        xLeft = random('Uniform', xRight - xMax, xRight);
    end

    xLength = xRight - xLeft;
    if (xLength < xMin)
        xAdd = random('Uniform', 0, xLength);

        xRight = xRight + xAdd;
        if (xRight > xBoard)
            xAdd = xRight - xBoard;
            xRight = xBoard;
        end

        xLeft = xLeft - xAdd;
        if (xLeft < 0)
            xRight = xRight + -1*xLeft;

            xLeft = 0;
        end
    end

    if (mod(x, 2) == 0)
        yBottom = random('Uniform', 0, yBoard - yMax);
        yTop = random('Uniform', yBottom, yBottom + yMax);
    else
        yTop = random('Uniform', 0+yMax, yBoard);
        yBottom = random('Uniform', yTop - yMax, yTop);
    end

    yHeight = yTop - yBottom;
    if (yHeight < yMin)
        yAdd = random('Uniform', 0, yHeight);

        yTop = yTop + yAdd;
        if (yTop > yBoard)
            yAdd = yTop - yBoard;
            yTop = yBoard;
        end

        yBottom = yBottom - (yHeight + yAdd);
        if (yBottom < 0)
            yTop = yTop + -1*yBottom;

            yBottom = 0;
        end
    end

    xs = [xLeft xRight xRight xLeft];
    ys = [yBottom yBottom yTop yTop];

    colorI = round(random('Uniform', 0, 6));
    switch (colorI)
        case 1
            color = blue;
        case 2
            color = black;
        case 3
            color = yellow;
        case 4
            color = red;
        otherwise
            color = white;
    end

    f = fill(xs, ys, color);

    fprintf('\nXYC%f:\n',  colorI);
    fprintf([repmat('%f\t', 1, size(xs, 2)) '\n'], xs');
    fprintf([repmat('%f\t', 1, size(ys, 2)) '\n'], ys');
    fprintf([repmat('%f\t', 1, size(color, 2)) '\n'], color');
end

hold off
shg
