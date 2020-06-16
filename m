Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3231F1FB2AB
	for <lists+linux-tegra@lfdr.de>; Tue, 16 Jun 2020 15:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbgFPNx6 (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 16 Jun 2020 09:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728899AbgFPNx5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Jun 2020 09:53:57 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 626F6C061573
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:57 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id t194so3162443wmt.4
        for <linux-tegra@vger.kernel.org>; Tue, 16 Jun 2020 06:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M3L/vhQHjDE+C9l0qudwi26/w+psczXMcfOt270RlEk=;
        b=WWyDyBs5/lglLdztMlKeP3eCq3IT9zB+pSBDzV9On7VRvPoGZ1onDmxKvlIMUrflCA
         DnBR2rYBuhKNuxgqb0YNj/i+ahf5DQJMe3n+MDHHao8lnCuiTyZ1Q/T2NH9RTqBDufET
         2WAN93v80t/wOu8ts5CYozmiqXUc9rYrkHy6KG0vZlohFvGWYzwO0A+keYAaFmDZLegV
         COMXdLz1S7ilS9BWHHZZssaVViCxzgmnDaArUxuYBP8begs2RtG3+IRthhMFP5njP0qW
         64urTl/UfKAZM63kk6Mfy+KJXzVwFgs1aYlxQoZjpMUbLxp6fRiZr0njqrQY6dkBT5Xw
         s1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M3L/vhQHjDE+C9l0qudwi26/w+psczXMcfOt270RlEk=;
        b=f9odwD7N6QibnGMIimzoRdiUHqHIHtbzRhIyc8rUsk1l5nZHkqS3cE2ODFHtB2zDUe
         IbcXQHQJDQkQ6H4KALi3+nTF+Gwc6725TWEWo9alhDjZnO7lB7HCxsIMC+tMCHBusELj
         ly9TKJgAJEjNN8Ab9pCUlFxqPD5M1sT9M2VZbtOUvF09yHxwSxD+ffvGjV0Rj5wybECD
         AeuQcNBPfZmirfHEKUiOkADI95qCQBSirf38/BMNO71Fr29DfoOt9lSZuo2WPXWP14Ip
         3cmI1nEVFVZIdSCXYpegdjLeAYFIr8AuACj1cgx96RAeD5Xkt84Aluj6+99Wf/IQdyBW
         7FRQ==
X-Gm-Message-State: AOAM53217iKzkIgbYcuE7eaIXRsgXaC1StioJdLNSELYi5/6tNIVFNQe
        3X7MHVDAIFW3/kpS5fF+1nU=
X-Google-Smtp-Source: ABdhPJzGk/jl8TeiUrND4uefnaHAqsSQ6+a99XBpUrP6SsfayTbaa6VwGdJdqbB2VWl0LieJIkYi2w==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr3404588wml.58.1592315636193;
        Tue, 16 Jun 2020 06:53:56 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b143sm4139276wme.20.2020.06.16.06.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 06:53:54 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 27/73] ARM: tegra: Use numeric unit-addresses
Date:   Tue, 16 Jun 2020 15:51:52 +0200
Message-Id: <20200616135238.3001888-28-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200616135238.3001888-1-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Unit-addresses should be numeric. This fixes a validation failure seen
using the json-schema tooling.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 91b6bb82e960..f6aa783b0f02 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -314,7 +314,7 @@ nvec@7000c500 {
 	memory-controller@7000f400 {
 		nvidia,use-ram-code;
 
-		emc-tables@hynix {
+		emc-tables@0 {
 			nvidia,ram-code = <0x0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.24.1

