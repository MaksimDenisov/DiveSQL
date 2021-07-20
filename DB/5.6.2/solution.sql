/*Поведение хранимой процедуры

Процедура должна обновить запись о рецензировании,
сли таковая имеется, и записать туда оценку, если этому не препятствуют описанные далее ограничения.
Кроме этого, если для статьи получено три оценки,
то процедура должна в момент получения третьей оценки записать в атрибут Paper.accepted посчитанное значение.
Это значение должно быть TRUE, если среднее арифметическое оценок больше 4, и  FALSE в противном случае.

Процедура должна завершиться успешно только в том случае, если она выполнила необходимые действия.
Если действие выполнить невозможно по причине некорректности данных или по еще какой-нибудь причине,
процедура должна выкинуть исключение с кодом 'DB017'. В PostgreSQL это делается так:
*/
CREATE OR REPLACE FUNCTION SubmitReview(_paper_id INT, _reviewer_id INT, _score INT)
    RETURNS VOID AS
$$

/*    Неужели можно поставить оценку несуществующей статье?
Неужели несуществующий рецензент может поставить оценку?
Неужели можно поставить оценку, не будучи рецензентом?
Три рецензента поставили хорошие оценки, а статья не принята*/
BEGIN
    IF _score < 1 OR
       _score > 7 or
       (select exists(select 1
                      from paperreviewing
                      where paper_id = _paper_id
                        AND reviewer_id = _reviewer_id)) = FALSE or
       (SELECT accepted FROM paper WHERE id = _paper_id) IS NOT NULL THEN
        RAISE SQLSTATE 'DB017';
    END IF;


    UPDATE paperreviewing
    SET score = _score
    WHERE paper_id = _paper_id
      AND reviewer_id = _reviewer_id;
    IF (SELECT count(score)
        FROM PaperReviewing
        WHERE paper_id = _paper_id
          AND score IS NOT NULL
        GROUP BY paper_id) > 2 THEN
        UPDATE paper
        SET accepted = (SELECT avg(score)
                        FROM PaperReviewing
                        WHERE paper_id = _paper_id
                        GROUP BY paper_id) > 4
        WHERE id = _paper_id;
    END IF;
END;
$$ LANGUAGE plpgsql;

/*
        IF (SELECT avg(score)
            FROM PaperReviewing
            WHERE paper_id = _paper_id
            GROUP BY paper_id) > 4 THEN
            UPDATE paper
            SET accepted = TRUE
            WHERE id = _paper_id;
        END IF;*/