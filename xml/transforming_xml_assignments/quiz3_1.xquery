<report>
  <title>Paintings on Egyptian Subject Matter</title>
  {
    for $item in fn:doc("basic2.xml")/catalog/images/image
    let $title := $item/title/text()
    let $artist := $item/artist/text()
    let $year := $item/year/text()
    return for $subject in $item/subject
        where fn:contains($subject, "Egyptian")
    order by $year descending
    return<artwork><title>{$title}</title><artist>{$artist}</artist><year>{$year}</year></artwork>
  }</report>
