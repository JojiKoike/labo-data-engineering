import dayjs from "dayjs";
import "dayjs/locale/ja";

dayjs.locale("ja");

/**
 *
 */
export function doPost(): GoogleAppsScript.Content.TextOutput {
  const text = dayjs().format("YYYY年M月D日(ddd) H:m");

  const data: SlackData = {
    text,
    response_type: "ephemeral",
  };

  console.log("test");

  return ContentService.createTextOutput(JSON.stringify(data)).setMimeType(
    ContentService.MimeType.JSON,
  );
}

interface SlackData {
  text: string;
  response_type: "ephemeral" | "in_chanel";
}
