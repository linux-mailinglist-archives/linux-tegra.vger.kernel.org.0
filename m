Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB4D29078E
	for <lists+linux-tegra@lfdr.de>; Fri, 16 Oct 2020 16:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409208AbgJPOo1 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 16 Oct 2020 10:44:27 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5244 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395502AbgJPOoY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 10:44:24 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f89b1bb0004>; Fri, 16 Oct 2020 07:44:11 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 14:44:19 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 14:44:14 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <pierre-louis.bossart@linux.intel.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <p.zabel@pengutronix.de>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sharadg@nvidia.com>, <mkumard@nvidia.com>,
        <viswanathl@nvidia.com>, <rlokhande@nvidia.com>,
        <dramesh@nvidia.com>, <atalambedu@nvidia.com>,
        <nwartikar@nvidia.com>, <swarren@nvidia.com>,
        <nicoleotsuka@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v4 09/15] ASoC: dt-bindings: audio-graph: Convert bindings to json-schema
Date:   Fri, 16 Oct 2020 20:12:56 +0530
Message-ID: <1602859382-19505-10-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602859451; bh=RyTACkfJLol9T31W1BcVM2gJiMkGWQqgZIrdnEgfZzs=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Type;
        b=XdCmlyui6uQQIKmhf0CWfoC0NtYgAYrOse9SBsjJzOrI/ZEz3fsBzjYLuSx/S8CRm
         eiygebc0vbx4wakudzBvdYqUA6fefp09/RGLTfzn25cTzGGCM/kkc5oQnFcjRLz2yS
         4DbOoGQJ//xWCXeSXi4OZv5UH62Zm+zyOG+hBnLkxSp40uIY37kMsSB31tS3rb95lb
         cfY+lM9NdnKv8T4ycjbS65yDM1CN48JXRZTVTly0y3Y9EwQx9l2w5olfa1zOLhlwqk
         8BugBY911JHpfm4KHwSArDAi1M/aH+l9f0m3fQ51ix/LYWwGFeRYyXI7J/NVe0xMkU
         L69sygLPzqsGw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert device tree bindings of audio graph card to YAML format. Also
expose some common definitions which can be used by similar graph based
audio sound cards.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/audio-graph-card.txt | 337 -------------
 .../bindings/sound/audio-graph-card.yaml           | 548 +++++++++++++++++++++
 2 files changed, 548 insertions(+), 337 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card.txt
 create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card.yaml

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.txt b/Documentation/devicetree/bindings/sound/audio-graph-card.txt
deleted file mode 100644
index d5f6919..0000000
--- a/Documentation/devicetree/bindings/sound/audio-graph-card.txt
+++ /dev/null
@@ -1,337 +0,0 @@
-Audio Graph Card:
-
-Audio Graph Card specifies audio DAI connections of SoC <-> codec.
-It is based on common bindings for device graphs.
-see ${LINUX}/Documentation/devicetree/bindings/graph.txt
-
-Basically, Audio Graph Card property is same as Simple Card.
-see ${LINUX}/Documentation/devicetree/bindings/sound/simple-card.yaml
-
-Below are same as Simple-Card.
-
-- label
-- widgets
-- routing
-- dai-format
-- frame-master
-- bitclock-master
-- bitclock-inversion
-- frame-inversion
-- mclk-fs
-- hp-det-gpio
-- mic-det-gpio
-- dai-tdm-slot-num
-- dai-tdm-slot-width
-- clocks / system-clock-frequency
-
-Required properties:
-
-- compatible				: "audio-graph-card";
-- dais					: list of CPU DAI port{s}
-
-Optional properties:
-- pa-gpios: GPIO used to control external amplifier.
-
------------------------
-Example: Single DAI case
------------------------
-
-	sound_card {
-		compatible = "audio-graph-card";
-
-		dais = <&cpu_port>;
-	};
-
-	dai-controller {
-		...
-		cpu_port: port {
-			cpu_endpoint: endpoint {
-				remote-endpoint = <&codec_endpoint>;
-
-				dai-format = "left_j";
-				...
-			};
-		};
-	};
-
-	audio-codec {
-		...
-		port {
-			codec_endpoint: endpoint {
-				remote-endpoint = <&cpu_endpoint>;
-			};
-		};
-	};
-
------------------------
-Example: Multi DAI case
------------------------
-
-	sound-card {
-		compatible = "audio-graph-card";
-
-		label = "sound-card";
-
-		dais = <&cpu_port0
-			&cpu_port1
-			&cpu_port2>;
-	};
-
-	audio-codec@0 {
-		...
-		port {
-			codec0_endpoint: endpoint {
-				remote-endpoint = <&cpu_endpoint0>;
-			};
-		};
-	};
-
-	audio-codec@1 {
-		...
-		port {
-			codec1_endpoint: endpoint {
-				remote-endpoint = <&cpu_endpoint1>;
-			};
-		};
-	};
-
-	audio-codec@2 {
-		...
-		port {
-			codec2_endpoint: endpoint {
-				remote-endpoint = <&cpu_endpoint2>;
-			};
-		};
-	};
-
-	dai-controller {
-		...
-		ports {
-			cpu_port0: port@0 {
-				cpu_endpoint0: endpoint {
-					remote-endpoint = <&codec0_endpoint>;
-
-					dai-format = "left_j";
-					...
-				};
-			};
-			cpu_port1: port@1 {
-				cpu_endpoint1: endpoint {
-					remote-endpoint = <&codec1_endpoint>;
-
-					dai-format = "i2s";
-					...
-				};
-			};
-			cpu_port2: port@2 {
-				cpu_endpoint2: endpoint {
-					remote-endpoint = <&codec2_endpoint>;
-
-					dai-format = "i2s";
-					...
-				};
-			};
-		};
-	};
-
-
------------------------
-Example: Sampling Rate Conversion
------------------------
-
-	sound_card {
-		compatible = "audio-graph-card";
-
-		label = "sound-card";
-		prefix = "codec";
-		routing = "codec Playback", "DAI0 Playback",
-			  "DAI0 Capture",   "codec Capture";
-		convert-rate = <48000>;
-
-		dais = <&cpu_port>;
-	};
-
-	audio-codec {
-		...
-		port {
-			codec_endpoint: endpoint {
-				remote-endpoint = <&cpu_endpoint>;
-			};
-		};
-	};
-
-	dai-controller {
-		...
-		cpu_port: port {
-			cpu_endpoint: endpoint {
-				remote-endpoint = <&codec_endpoint>;
-
-				dai-format = "left_j";
-				...
-			};
-		};
-	};
-
------------------------
-Example: 2 CPU 1 Codec (Mixing)
------------------------
-
-	sound_card {
-		compatible = "audio-graph-card";
-
-		label = "sound-card";
-		routing = "codec Playback", "DAI0 Playback",
-			  "codec Playback", "DAI1 Playback",
-			  "DAI0 Capture",   "codec Capture";
-
-		dais = <&cpu_port>;
-	};
-
-	audio-codec {
-		...
-
-		audio-graph-card,prefix = "codec";
-		audio-graph-card,convert-rate = <48000>;
-		port {
-			reg = <0>;
-			codec_endpoint0: endpoint@0 {
-				remote-endpoint = <&cpu_endpoint0>;
-			};
-			codec_endpoint1: endpoint@1 {
-				remote-endpoint = <&cpu_endpoint1>;
-			};
-		};
-	};
-
-	dai-controller {
-		...
-		cpu_port: port {
-			cpu_endpoint0: endpoint@0 {
-				remote-endpoint = <&codec_endpoint0>;
-
-				dai-format = "left_j";
-				...
-			};
-			cpu_endpoint1: endpoint@1 {
-				remote-endpoint = <&codec_endpoint1>;
-
-				dai-format = "left_j";
-				...
-			};
-		};
-	};
-
------------------------
-Example: Multi DAI with DPCM
------------------------
-
-	CPU0 ------ ak4613
-	CPU1 ------ HDMI
-	CPU2 ------ PCM3168A-p	/* DPCM 1ch/2ch */
-	CPU3 --/		/* DPCM 3ch/4ch */
-	CPU4 --/		/* DPCM 5ch/6ch */
-	CPU5 --/		/* DPCM 7ch/8ch */
-	CPU6 ------ PCM3168A-c
-
-	sound_card: sound {
-		compatible = "audio-graph-card";
-
-		label = "sound-card";
-
-		routing =	"pcm3168a Playback", "DAI2 Playback",
-				"pcm3168a Playback", "DAI3 Playback",
-				"pcm3168a Playback", "DAI4 Playback",
-				"pcm3168a Playback", "DAI5 Playback";
-
-		dais = <&snd_port0	/* ak4613 */
-			&snd_port1	/* HDMI0  */
-			&snd_port2	/* pcm3168a playback */
-			&snd_port3	/* pcm3168a capture  */
-			>;
-	};
-
-	ak4613: codec@10 {
-		...
-		port {
-			ak4613_endpoint: endpoint {
-				remote-endpoint = <&rsnd_endpoint0>;
-			};
-		};
-	};
-
-	pcm3168a: audio-codec@44 {
-		...
-		audio-graph-card,prefix = "pcm3168a";
-		audio-graph-card,convert-channels = <8>; /* TDM Split */
-		ports {
-			port@0 {
-				reg = <0>;
-				pcm3168a_endpoint_p1: endpoint@1 {
-					remote-endpoint = <&rsnd_endpoint2>;
-					...
-				};
-				pcm3168a_endpoint_p2: endpoint@2 {
-					remote-endpoint = <&rsnd_endpoint3>;
-					...
-				};
-				pcm3168a_endpoint_p3: endpoint@3 {
-					remote-endpoint = <&rsnd_endpoint4>;
-					...
-				};
-				pcm3168a_endpoint_p4: endpoint@4 {
-					remote-endpoint = <&rsnd_endpoint5>;
-					...
-				};
-			};
-			port@1 {
-				reg = <1>;
-				pcm3168a_endpoint_c: endpoint {
-					remote-endpoint = <&rsnd_endpoint6>;
-					...
-				};
-			};
-		};
-	};
-
-	&sound {
-		ports {
-			snd_port0: port@0 {
-				rsnd_endpoint0: endpoint {
-					remote-endpoint = <&ak4613_endpoint>;
-					...
-				};
-			};
-			snd_port1: port@1 {
-				rsnd_endpoint1: endpoint {
-					remote-endpoint = <&dw_hdmi0_snd_in>;
-					...
-				};
-			};
-			snd_port2: port@2 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				rsnd_endpoint2: endpoint@2 {
-					remote-endpoint = <&pcm3168a_endpoint_p1>;
-					...
-				};
-				rsnd_endpoint3: endpoint@3 {
-					remote-endpoint = <&pcm3168a_endpoint_p2>;
-					...
-				};
-				rsnd_endpoint4: endpoint@4 {
-					remote-endpoint = <&pcm3168a_endpoint_p3>;
-					...
-				};
-				rsnd_endpoint5: endpoint@5 {
-					remote-endpoint = <&pcm3168a_endpoint_p4>;
-					...
-				};
-			};
-			snd_port3: port@6 {
-				rsnd_endpoint6: endpoint {
-					remote-endpoint = <&pcm3168a_endpoint_c>;
-					...
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
new file mode 100644
index 0000000..d4b56bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
@@ -0,0 +1,548 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/audio-graph-card.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic audio graph card
+
+description: |
+  Audio Graph Card specifies audio DAI connections of SoC <-> codec.
+  It is based on common bindings for device graphs.
+  see ${LINUX}/Documentation/devicetree/bindings/graph.yaml
+
+  Basically, Audio Graph Card properties are similar to Simple Card.
+  see ${LINUX}/Documentation/devicetree/bindings/sound/simple-card.yaml
+  Common definitions required here are referenced from above.
+
+maintainers:
+  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+
+definitions:
+
+  end-point:
+    type: object
+    properties:
+      mclk-fs:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/mclk-fs
+
+      prefix:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/prefix
+
+      convert-rate:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/convert-rate
+
+      convert-channels:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/convert-channels
+
+      frame-inversion:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/frame-inversion
+
+      bitclock-inversion:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/bitclock-inversion
+
+      frame-master:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/frame-master
+
+      bitclock-master:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/bitclock-master
+
+      dai-tdm-slot-num:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/dai-tdm-slot-num
+
+      dai-tdm-slot-width:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/dai-tdm-slot-width
+
+      clocks:
+        maxItems: 1
+
+      system-clock-frequency:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/system-clock-frequency
+
+      system-clock-direction-out:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/system-clock-direction-out
+
+      dai-format:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/format
+
+      remote-endpoint:
+        description: phandle to an 'endpoint' subnode of a remote device node.
+        $ref: /schemas/types.yaml#/definitions/phandle
+
+  port:
+    type: object
+    description: |
+      If there is more than one 'port' or more than one 'endpoint' node
+      or 'reg' property present in the port and/or endpoint nodes then
+      '#address-cells' and '#size-cells' properties are required in relevant
+      parent node.
+    properties:
+      convert-rate:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/convert-rate
+
+      convert-channels:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/convert-channels
+
+      prefix:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/prefix
+
+      mclk-fs:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/mclk-fs
+
+    patternProperties:
+      "^endpoint(@[0-9a-f]+)?$":
+        type: object
+        $ref: "#/definitions/end-point"
+
+  ports:
+    type: object
+    properties:
+      convert-rate:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/convert-rate
+
+      convert-channels:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/convert-channels
+
+      prefix:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/prefix
+
+      mclk-fs:
+        $ref: /schemas/sound/simple-card.yaml#/definitions/mclk-fs
+
+    patternProperties:
+      "^port(@[0-9a-f]+)?$":
+        $ref: "#/definitions/port"
+
+properties:
+  compatible:
+    items:
+      - const: audio-graph-card
+
+  dais:
+    description: list of CPU DAI port{s}
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  label:
+    $ref: /schemas/sound/simple-card.yaml#/definitions/label
+
+  pa-gpios:
+    description: GPIO used to control external amplifier.
+
+  widgets:
+    $ref: /schemas/sound/simple-card.yaml#/definitions/widgets
+
+  routing:
+    $ref: /schemas/sound/simple-card.yaml#/definitions/routing
+
+  convert-rate:
+    $ref: /schemas/sound/simple-card.yaml#/definitions/convert-rate
+
+  convert-channels:
+    $ref: /schemas/sound/simple-card.yaml#/definitions/convert-channels
+
+  mclk-fs:
+    $ref: /schemas/sound/simple-card.yaml#/definitions/mclk-fs
+
+  prefix:
+    $ref: /schemas/sound/simple-card.yaml#/definitions/prefix
+
+  hp-det-gpio:
+    maxItems: 1
+
+  mic-det-gpio:
+    maxItems: 1
+
+  ports:
+    $ref: "#/definitions/ports"
+
+patternProperties:
+  "^port(@[0-9a-f]+)?$":
+    $ref: "#/definitions/port"
+
+required:
+  - compatible
+  - dais
+
+additionalProperties: false
+
+examples:
+  # ---------------
+  # Single DAI case
+  # ---------------
+  - |
+    sound_card {
+        compatible = "audio-graph-card";
+
+        dais = <&cpu_port>;
+    };
+
+    dai-controller {
+        // ...
+
+        cpu_port: port {
+            cpu_endpoint: endpoint {
+                remote-endpoint = <&codec_endpoint>;
+
+                dai-format = "left_j";
+
+                // ...
+            };
+        };
+    };
+
+    audio-codec {
+        // ...
+
+        port {
+            codec_endpoint: endpoint {
+                remote-endpoint = <&cpu_endpoint>;
+            };
+        };
+    };
+
+  # --------------
+  # Multi DAI case
+  # --------------
+  - |
+    sound-card {
+        compatible = "audio-graph-card";
+
+        label = "sound-card";
+
+        dais = <&cpu_port0
+                &cpu_port1
+                &cpu_port2>;
+    };
+
+    audio-codec-0 {
+        // ...
+
+        port {
+            codec0_endpoint: endpoint {
+                remote-endpoint = <&cpu_endpoint0>;
+            };
+        };
+    };
+
+    audio-codec-1 {
+        // ...
+
+        port {
+            codec1_endpoint: endpoint {
+                remote-endpoint = <&cpu_endpoint1>;
+            };
+        };
+    };
+
+    audio-codec-2 {
+        // ...
+
+        port {
+            codec2_endpoint: endpoint {
+                remote-endpoint = <&cpu_endpoint2>;
+            };
+        };
+    };
+
+    dai-controller {
+        // ...
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            cpu_port0: port@0 {
+                reg = <0>;
+
+                cpu_endpoint0: endpoint {
+                    remote-endpoint = <&codec0_endpoint>;
+
+                    dai-format = "left_j";
+
+                    // ...
+                };
+            };
+            cpu_port1: port@1 {
+                reg = <1>;
+
+                cpu_endpoint1: endpoint {
+                    remote-endpoint = <&codec1_endpoint>;
+
+                    dai-format = "i2s";
+
+                    // ...
+                };
+            };
+            cpu_port2: port@2 {
+                reg = <2>;
+
+                cpu_endpoint2: endpoint {
+                    remote-endpoint = <&codec2_endpoint>;
+
+                    dai-format = "i2s";
+
+                    // ...
+                };
+            };
+        };
+    };
+
+  # ------------------------
+  # Sampling Rate Conversion
+  # ------------------------
+  - |
+    sound_card {
+        compatible = "audio-graph-card";
+
+        label = "sound-card";
+        prefix = "codec";
+        routing = "codec Playback", "DAI0 Playback",
+                  "DAI0 Capture",   "codec Capture";
+        convert-rate = <48000>;
+
+        dais = <&cpu_port_src>;
+    };
+
+    audio-codec {
+        // ...
+
+        port {
+            codec_endpoint_src: endpoint {
+                remote-endpoint = <&cpu_endpoint_src>;
+            };
+        };
+    };
+
+    dai-controller {
+        // ...
+
+        cpu_port_src: port {
+            cpu_endpoint_src: endpoint {
+                remote-endpoint = <&codec_endpoint_src>;
+
+                dai-format = "left_j";
+
+                // ...
+            };
+        };
+    };
+
+  # ----------------------
+  # 2 CPU 1 Codec (Mixing)
+  # ----------------------
+  - |
+    sound_card {
+        compatible = "audio-graph-card";
+
+        label = "sound-card";
+        routing = "codec Playback", "DAI0 Playback",
+                  "codec Playback", "DAI1 Playback",
+                  "DAI0 Capture",   "codec Capture";
+
+        dais = <&cpu_port_mix>;
+    };
+
+    audio-codec {
+        // ...
+
+        audio-graph-card,prefix = "codec";
+        audio-graph-card,convert-rate = <48000>;
+
+        port {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            codec_endpoint0_mix: endpoint@0 {
+                reg = <0>;
+
+                remote-endpoint = <&cpu_endpoint0_mix>;
+            };
+            codec_endpoint1_mix: endpoint@1 {
+                reg = <1>;
+
+                remote-endpoint = <&cpu_endpoint1_mix>;
+            };
+        };
+    };
+
+    dai-controller {
+        // ...
+
+        cpu_port_mix: port {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            cpu_endpoint0_mix: endpoint@0 {
+                reg = <0>;
+
+                remote-endpoint = <&codec_endpoint0_mix>;
+
+                dai-format = "left_j";
+
+                // ...
+            };
+            cpu_endpoint1_mix: endpoint@1 {
+                reg = <1>;
+
+                remote-endpoint = <&codec_endpoint1_mix>;
+
+                dai-format = "left_j";
+
+                // ...
+            };
+        };
+    };
+
+  # -------------------
+  # Multi DAI with DPCM
+  #
+  #  CPU0 ------ ak4613
+  #  CPU1 ------ HDMI
+  #  CPU2 ------ PCM3168A-p    /* DPCM 1ch/2ch */
+  #  CPU3 --/                  /* DPCM 3ch/4ch */
+  #  CPU4 --/                  /* DPCM 5ch/6ch */
+  #  CPU5 --/                  /* DPCM 7ch/8ch */
+  #  CPU6 ------ PCM3168A-c
+  # -------------------
+  - |
+    sound_card: sound {
+        compatible = "audio-graph-card";
+
+        label = "sound-card";
+
+        routing = "pcm3168a Playback", "DAI2 Playback",
+                  "pcm3168a Playback", "DAI3 Playback",
+                  "pcm3168a Playback", "DAI4 Playback",
+                  "pcm3168a Playback", "DAI5 Playback";
+
+        dais = <&snd_port0    /* ak4613 */
+                &snd_port1    /* HDMI0  */
+                &snd_port2    /* pcm3168a playback */
+                &snd_port3    /* pcm3168a capture  */
+                >;
+    };
+
+    ak4613: codec-10 {
+        // ...
+
+        port {
+            ak4613_endpoint: endpoint {
+                remote-endpoint = <&rsnd_endpoint0>;
+            };
+        };
+    };
+
+    pcm3168a: audio-codec-44 {
+        // ...
+
+        audio-graph-card,prefix = "pcm3168a";
+        audio-graph-card,convert-channels = <8>; /* TDM Split */
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                reg = <0>;
+                pcm3168a_endpoint_p1: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&rsnd_endpoint2>;
+
+                    // ...
+                };
+                pcm3168a_endpoint_p2: endpoint@2 {
+                    reg = <2>;
+                    remote-endpoint = <&rsnd_endpoint3>;
+
+                    // ...
+                };
+                pcm3168a_endpoint_p3: endpoint@3 {
+                    reg = <3>;
+                    remote-endpoint = <&rsnd_endpoint4>;
+
+                    // ...
+                };
+                pcm3168a_endpoint_p4: endpoint@4 {
+                    reg = <4>;
+                    remote-endpoint = <&rsnd_endpoint5>;
+
+                    // ...
+                };
+            };
+            port@1 {
+                reg = <1>;
+                pcm3168a_endpoint_c: endpoint {
+                    remote-endpoint = <&rsnd_endpoint6>;
+
+                    // ...
+                };
+            };
+        };
+    };
+
+    dai-controller {
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            snd_port0: port@0 {
+                reg = <0>;
+                rsnd_endpoint0: endpoint {
+                    remote-endpoint = <&ak4613_endpoint>;
+
+                    // ...
+                };
+            };
+            snd_port1: port@1 {
+                reg = <1>;
+                rsnd_endpoint1: endpoint {
+                    remote-endpoint = <&dw_hdmi0_snd_in>;
+
+                    // ...
+                };
+            };
+            snd_port2: port@2 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                reg = <2>;
+                rsnd_endpoint2: endpoint@2 {
+                    reg = <2>;
+                    remote-endpoint = <&pcm3168a_endpoint_p1>;
+
+                    // ...
+                };
+                rsnd_endpoint3: endpoint@3 {
+                    reg = <3>;
+                    remote-endpoint = <&pcm3168a_endpoint_p2>;
+
+                    // ...
+                };
+                rsnd_endpoint4: endpoint@4 {
+                    reg = <4>;
+                    remote-endpoint = <&pcm3168a_endpoint_p3>;
+
+                    // ...
+                };
+                rsnd_endpoint5: endpoint@5 {
+                    reg = <5>;
+                    remote-endpoint = <&pcm3168a_endpoint_p4>;
+
+                    // ...
+                };
+            };
+            snd_port3: port@6 {
+                reg = <6>;
+                rsnd_endpoint6: endpoint {
+                    remote-endpoint = <&pcm3168a_endpoint_c>;
+
+                    // ...
+                };
+            };
+        };
+    };
+
+...
-- 
2.7.4

