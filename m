Return-Path: <linux-tegra+bounces-11457-lists+linux-tegra=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-tegra@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLXAH5dLcmnuiQAAu9opvQ
	(envelope-from <linux-tegra+bounces-11457-lists+linux-tegra=lfdr.de@vger.kernel.org>)
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 17:08:55 +0100
X-Original-To: lists+linux-tegra@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BA869A1F
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 17:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 780A73093843
	for <lists+linux-tegra@lfdr.de>; Thu, 22 Jan 2026 15:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761843587BF;
	Thu, 22 Jan 2026 15:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksqyuMOY"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1D72DEA8F
	for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 15:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095651; cv=none; b=Uy6uGeWvpCsptWWBOSdMw8GmBOk/1NSeovWFEhVt2vA41eeyde2VKcShbXmc7NRopfptgOENFr7wPfAJgEsNyAPAONWMyE75KRjRvGu7prT83ufk7hHknusnI0OunZAtWd14nCvwsSypKhxV/cYPt3BOtZtj9mRiRNROFcfa+DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095651; c=relaxed/simple;
	bh=yf2aPzz4UTyPSbv5ojv4evhBkQRP5VUgGqfXtk4W1B4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDhi0QAy0hSva6JOlFIXgZp/oZInXIt8AY7hNhsarzy/zJS+PUAcWZXNUuwpjSvIOwxcIimi6zFPud4h5KTRE5ekk1S+bxOFIzBpR03XERRbCECXq4G6U22uX8ar9tmRn4ZU2vsP+RbGUSlUoVweHQ319pzTnk726QgpPAY099k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksqyuMOY; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so1128421f8f.2
        for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 07:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769095646; x=1769700446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67NAYtQ7tXtXTvo7lx+0/H0CjnIzqwXkUlVV+IQgLuM=;
        b=ksqyuMOYIwgfDCPSSoeseMFgkSK5kWSvniEv5mZhiYgWBceFSkcddl3iirBvJ4f8LW
         fZY5Da2meXceBC6d8zvOhsVgNtQPv8MOCVmUPJ9iiGxP9Sejq77ialGjMHNxn8Cpi+rs
         OejtBMtAg6wNfFeraWCSNNXwD5O8qqMz7toNEdhrYsLvIYFCzmJVUKwM8thrjBPLgj6C
         R17pzl+ClmlJ0TYyfosqyfw+r+soOSwoGOVp7yC+x52jFahaiscEd3BKuiLZGoAztNp5
         sEnq4uAg5GpDuxf/06qekwXm0gW4GlJFKKNOCBdqLpb0R3ioibNab1et+iQo5PUNj20b
         V55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769095646; x=1769700446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=67NAYtQ7tXtXTvo7lx+0/H0CjnIzqwXkUlVV+IQgLuM=;
        b=bxJzMfeFsSHwXaHeoo43oiv4W21ZnBh/l8AgDU89qsJ9G43kXOyhVtjzyY1G1CSYX2
         9BVq5C7pafrSwucVHNDoWYWBs43f4uWGEGNngivzVhLPm1AW/XOdd+nFXz8/GGluU7Cj
         f8C9nR+ZMkt+sbjEPDX4RVzfzgtpZI7Wk5AfixQFH1wxZ4u9VGoeUmvy0NT8Ont+Ngov
         fAkLrDXd2WXG/qc3vognHmhjujp1MqIcKsjm3UXDkSjT4hYaauabTovNfj3yhHCedSIO
         OMxewjGozoqjqWoHGzdLiHFj+HqNs3geZ7ByHxjJ6Db6O7IaRqA9CD65gKf82jGNBPJw
         QsBg==
X-Forwarded-Encrypted: i=1; AJvYcCXl6Vk9vOMAFKVRioBpvL/pyNh8JRsuBG1fxP1UbsMLqF0emmR1FquAYJ5cNkWBoH+H0OfPBSb6tTSc2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlwbnCXnppTKzAYHEV3uqcYdHFU2oYCmT7AvHIgg9b/V8t106/
	QaWkfmdzeRdiN2QLgxjieJaWEHiShEt2rWUpM1u1aFF+dSCU9R2wRtu+
X-Gm-Gg: AZuq6aKabfxZqVV+KbY49RyBaJpjcSzfhK6dtInS8nsIa19202OU6W4OItFhelC6drb
	DmF/obIHRa/UfWlE5Xn6he8WHdNpfFLURui+bPsf/Ud4qUAga1/cWqsvvn9RFlAKa/cjTxYd/1M
	139rwCX7ElfWud/VbrfeBF8tCuWJVCetPXOhr+YLZ42Fbrgb8xVBMzklyiSiiE629fHW5CXZH7g
	Y+60hhflbKMhmtuchM3BYZ2gkXqmYRZLK3Ni/kP/8Np+Sb1yt32ROEcrVP0UZ2HwQW84++GUxuu
	3qXOM3PVyOXxhuW/ixL66vreD6a8gax4FP428Rdiyzc8gugcKjbzqvpRSv2My6boJnc7YhJ4Axk
	/INdDJKfKE7AS/cs9VFO/+pkFTnHG8uHRjaRpgZv8wxQGU4VqjvCBwGThvJlBtjIdjO3Dno6xNV
	M8BSOUDKPIlYA=
X-Received: by 2002:a05:6000:2303:b0:435:a363:f29e with SMTP id ffacd0b85a97d-435a363f552mr8627619f8f.11.1769095646287;
        Thu, 22 Jan 2026 07:27:26 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4358f138e26sm20762642f8f.17.2026.01.22.07.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:27:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] ARM: tegra: lg-x3: add USB and power related nodes
Date: Thu, 22 Jan 2026 17:27:12 +0200
Message-ID: <20260122152713.8311-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122152713.8311-1-clamor95@gmail.com>
References: <20260122152713.8311-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-11457-lists,linux-tegra=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,nvidia.com,yahoo.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-tegra@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_PROHIBIT(0.00)[0.0.0.11:email];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-tegra,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.48:email,0.0.0.0:email,0.0.0.44:email,0.0.0.36:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,4.166.49.216:email,7000c500:email,7d000000:email,0.0.0.35:email]
X-Rspamd-Queue-Id: B0BA869A1F
X-Rspamd-Action: no action

Add missing charger, MUIC, and ADC sensor nodes. Reconfigure USB, set one
of the ADC channels as the fuel gauge temperature sensor, and add a
battery thermal zone.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi | 93 ++++++++++++++++++++-
 1 file changed, 91 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index d71d1d6694f8..25c238562b9a 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -1070,6 +1070,38 @@ rmi4-f11@11 {
 				syna,clip-y-low = <0>;
 			};
 		};
+
+		max14526: muic@44 {
+			compatible = "maxim,max14526";
+			reg = <0x44>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(J, 0) IRQ_TYPE_EDGE_FALLING>;
+
+			muic_con: connector {
+				compatible = "usb-b-connector";
+				label = "micro-USB";
+				type = "micro";
+			};
+
+			port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				muic_to_charger: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&charger_input>;
+				};
+			};
+		};
+
+		tsc2007: adc@48 {
+			compatible = "ti,tsc2007";
+			reg = <0x48>;
+
+			ti,x-plate-ohms = <1>;
+			#io-channel-cells = <1>;
+		};
 	};
 
 	cam_i2c: i2c@7000c500 {
@@ -1326,6 +1358,22 @@ ldo8 {
 			};
 		};
 
+		max8971: charger@35 {
+			compatible = "maxim,max8971";
+			reg = <0x35>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(J, 2) IRQ_TYPE_LEVEL_LOW>;
+
+			monitored-battery = <&battery>;
+
+			port {
+				charger_input: endpoint {
+					remote-endpoint = <&muic_to_charger>;
+				};
+			};
+		};
+
 		fuel-gauge@36 {
 			compatible = "maxim,max17043";
 			reg = <0x36>;
@@ -1334,6 +1382,10 @@ fuel-gauge@36 {
 			interrupts = <TEGRA_GPIO(S, 0) IRQ_TYPE_EDGE_FALLING>;
 
 			monitored-battery = <&battery>;
+			power-supplies = <&max8971>;
+
+			io-channels = <&tbattery 0>;
+			io-channel-names = "temp";
 
 			maxim,alert-low-soc-level = <10>;
 			wakeup-source;
@@ -1514,12 +1566,13 @@ sdmmc4: mmc@78000600 {
 	usb@7d000000 {
 		compatible = "nvidia,tegra30-udc";
 		status = "okay";
-		dr_mode = "peripheral";
+		dr_mode = "otg";
+		extcon = <&max14526>, <&max14526>;
 	};
 
 	usb-phy@7d000000 {
 		status = "okay";
-		dr_mode = "peripheral";
+		dr_mode = "otg";
 		nvidia,hssync-start-delay = <0>;
 		nvidia,xcvr-lsfslew = <2>;
 		nvidia,xcvr-lsrslew = <2>;
@@ -1803,7 +1856,43 @@ sound {
 					 <&tegra_car TEGRA30_CLK_EXTERN1>;
 	};
 
+	tbattery: thermal-sensor-battery {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+
+		io-channels = <&tsc2007 4>;
+		io-channel-names = "sensor-channel";
+		#io-channel-cells = <1>;
+
+		temperature-lookup-table = <
+			(-50000) 4100 (-40000) 3980 (-30000) 3815 (-20000) 3610
+			(-10000) 3285        0 2880    10000 2445    20000 1955
+			   30000 1440    40000 1125    50000  840    60000  665
+			   70000  465    80000  350    90000  230   100000  185 >;
+	};
+
 	thermal-zones {
+		battery-thermal {
+			polling-delay-passive = <0>; /* milliseconds */
+			polling-delay = <20000>; /* milliseconds */
+
+			thermal-sensors = <&tbattery>;
+
+			trips {
+				battery-alert {
+					temperature = <55000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				battery-crit {
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
 		/*
 		 * NCT72 has two sensors:
 		 *
-- 
2.51.0


