#!/bin/bash
cd "$(dirname "$0")"

if [ "$2" == "" ]; then
  echo "USAGE:"
  echo -e "\tdp_browser.sh <sink_name> <URL>"
  echo ""
  echo "Example:"
  echo -e "\tdp_browser.sh meeting 'http://example.com/meeting'"
  exit
fi

ENCODED_URL=$(python -c "import urllib; print urllib.quote('''$2''')")
ENCODED_TITLE=$(python -c "import urllib; print urllib.quote('''$1''')")

PD=$(mktemp -d)

# https://developer.mozilla.org/en-US/docs/Mozilla/Firefox/Enterprise_deployment_before_60
cat <<EOT >>$PD/prefs.js

user_pref("security.csp.enable", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("app.normandy.first_run", false);
user_pref("browser.eme.ui.firstContentShown", true);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);


// Disable updater
user_pref("app.update.enabled", false);

// make absolutely sure it is really off
user_pref("app.update.auto", false);
user_pref("app.update.mode", 0);
user_pref("app.update.service.enabled", false);


// Don't show 'know your rights' on first run
user_pref("browser.rights.3.shown", true);

// Don't show WhatsNew on first run after every update
user_pref("browser.startup.homepage_override.mstone","ignore");

// Disable the internal PDF viewer
user_pref("pdfjs.disabled", true);

// Disable the flash to javascript converter
user_pref("shumway.disabled", true);

// Don't ask to install the Flash plugin
user_pref("plugins.notifyMissingFlash", false);

//Disable plugin checking
user_pref("plugins.hide_infobar_for_outdated_plugin", true);


// Disable health reporter
user_pref("datareporting.healthreport.service.enabled", false);

// Disable all data upload (Telemetry and FHR)
user_pref("datareporting.policy.dataSubmissionEnabled", false);

// Disable crash reporter
user_pref("toolkit.crashreporter.enabled", false);

EOT

URL="file://$(realpath frame.html)?title=$ENCODED_TITLE&url=$ENCODED_URL"

CMD="firefox --no-remote --profile '${PD}' '${URL}'"

./dedicated_pulse_out.sh $1 "${CMD}"

rm -Rf ${PD}
