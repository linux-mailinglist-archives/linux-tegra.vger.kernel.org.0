Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFE8A128DA9
	for <lists+linux-tegra@lfdr.de>; Sun, 22 Dec 2019 12:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfLVLjb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 22 Dec 2019 06:39:31 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37273 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfLVLjb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 22 Dec 2019 06:39:31 -0500
Received: by mail-wr1-f66.google.com with SMTP id w15so1105164wru.4;
        Sun, 22 Dec 2019 03:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PChRUMW9auoj+phzTf35Lj5Jn5Dt732fjHL2+shj1VU=;
        b=G8ULdGQQMtShCJw5KW6yxwKGk7STXPm9E0TAfjC+/kILUQwyr2znxi7FRhlG/mMn3f
         niVJkj4KZ2tBze8Tkvr2SQXLBN6CA6bKaPzpATctGFJeiUBpUBmLdgVz/T3/lM8fBPWM
         gnZ2S51TMo2i6Gw1agCvagEGaeurrnbgpWaEP/JPJ16B7N1eXzBoHnT+rFPklop5jqt5
         DHB8ddVyhyutygR4HnOAcTGC6tvmk13qm5Q9Dygt+/e4oOZ2c09RhwbKOGjvOEHIpX+Y
         itJeTjML3a23isfo3RFsWCPN8CqWRzAYSv3cs3XTfuoprcnvxHmI4b/lf5c+pPH7qk5O
         IAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PChRUMW9auoj+phzTf35Lj5Jn5Dt732fjHL2+shj1VU=;
        b=ZspY8DeC664brK0wfbSg/gsPfDvWgUuA0C8+OFvAF03g72nUH9ycD1+Uvedvv9bw7m
         HMHWrEVTSCTbRunve+yZU94zfSHEDHT9P4g6ps0UIwUut8LIGTUIWcBNrC9PriN/XgAP
         4/I+N9/nG2ePWNt8Lw8iCm/HhRHlvOjtShIZUKv3K5Cf3Q9Znyb1qzP8OGfBtJHo9NnM
         BTPiVG8690FVRKDTs5tgB0GTsABFEEp/p9NcIzVFVuc7hJEjrXRB3A3Q0rskLFvij8OM
         IynzYr9S7uDjn2a2FF1FP4F4GeYH3MdzXttrnNGlldrA0hhb4q3TVpAAf/gFBZL6LulH
         hG7A==
X-Gm-Message-State: APjAAAUjNA2eWiaykTGvL54qkdWTK0vvpW2FGuCFOmoKGzvc4U8FFqtC
        VDq4W9NX2j94HFxu0Sk5Rbg=
X-Google-Smtp-Source: APXvYqx1SBFhabDrCk+eVxzYV3mkiRmOJXChs4DUz6kRpRkKairt3vKEfs8KW2jdm+Gn8/L+hM/RWw==
X-Received: by 2002:a5d:44ca:: with SMTP id z10mr26636538wrr.266.1577014769116;
        Sun, 22 Dec 2019 03:39:29 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id f65sm16081024wmf.2.2019.12.22.03.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 03:39:28 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/6] ARM: tegra: Let the EMC hardware use the EMC clock
Date:   Sun, 22 Dec 2019 12:39:18 +0100
Message-Id: <20191222113921.1469372-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222113921.1469372-1-thierry.reding@gmail.com>
References: <20191222113921.1469372-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The EMC hardware block needs access to the EMC clock in order to scale
the external memory frequency. Add the clocks property so that drivers
for the EMC can acquire a reference to the EMC clock.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 413bfb981de8..a01092b6d26d 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -625,6 +625,8 @@ mc: memory-controller@70019000 {
 	emc: emc@7001b000 {
 		compatible = "nvidia,tegra124-emc";
 		reg = <0x0 0x7001b000 0x0 0x1000>;
+		clocks = <&tegra_car TEGRA124_CLK_EMC>;
+		clock-names = "emc";
 
 		nvidia,memory-controller = <&mc>;
 	};
-- 
2.24.1

