Return-Path: <linux-tegra+bounces-1257-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DBB880659
	for <lists+linux-tegra@lfdr.de>; Tue, 19 Mar 2024 21:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C94B1C21D69
	for <lists+linux-tegra@lfdr.de>; Tue, 19 Mar 2024 20:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7583FB99;
	Tue, 19 Mar 2024 20:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LrPMDPN7"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EADD3F9C6
	for <linux-tegra@vger.kernel.org>; Tue, 19 Mar 2024 20:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710881934; cv=none; b=d3DD7Tau9ynnH8zjVafbufg/H86n3XFVwXgHfCXkL3owqGkuHxudDlWmYE7QT+EEdjQyBhm5dd3vuRrCcGAtHI8FLtT5Bzx55UAnP86P6JmI1VAMv2HquOTLOUx/zzuyi0v33MPJo7ILQarxgZ0z4eUhYqSneujpsRD65BL6w+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710881934; c=relaxed/simple;
	bh=1zsj+M/d9chbnwHl1CpZYf7kzFLbX8aqGDVZhE8fT8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=teOv6helOhoP3ZJsK5PTU3Z9eCAMG5eF3uev2tZq0BCJ/kyLRBbg3D8dQCZ/vBxC7xNsptO09ZySJlqomkZ2LSW+poOYA3wYV8MRRc5s2IM0txsS2YDFz5dUA5hCiCwkcSlMfU/1Eg7vTb4UBUc31SwTu0XEheafx9hUr/MqOUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LrPMDPN7; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6b22af648so216153b3a.0
        for <linux-tegra@vger.kernel.org>; Tue, 19 Mar 2024 13:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710881932; x=1711486732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yvO6Pb0Q30VcXTFiNcwxiPMuBmsILWnZccwRus/VuqA=;
        b=LrPMDPN7DIHXep07bfHUFLuHf1xZ97oc+2uTzmanCYnIsFfF8xq1jgMAbC0/EsKYv0
         FOoAfBba067OrayLKyJoYuuj1uVMOMf8igxUSLkcKZq1i6u+88ON58gU4j++AUdwBhnQ
         9A6XcIyl8Q3NdayUvP+pqBnfOMLT/xOMFrXwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710881932; x=1711486732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvO6Pb0Q30VcXTFiNcwxiPMuBmsILWnZccwRus/VuqA=;
        b=pGm+o2Qa1YGKZcR1dYSkuWO4u+Be827q9fnXtroYpASsMJgKOo48zNyhEXnu/xNtQP
         LMnUTGm5pDRZ0Km5bQOwoJVBpDIb7/vIA/rUVm3jlSoF1MuuM9TPqJyh3ICPb7NHlcS0
         L54P4dihm+5HB+UQ7/Bi3INsf1cw9Jh6BhK8B683K40sVus83d1K7g9epIcL31Kxnciq
         qjP3ab2tgddgaHU5C54IrhLJjcK7WtyLz7qAdjT3AvdoVm3t58XoFF4dZFlJlhoPoA3D
         7LRYmZtxlG7BiBb/Z7KS96A1VYuhgPwKWSGGQvb/VcsP4cavJKgTceDshYE4xhXmVA3e
         8qpQ==
X-Gm-Message-State: AOJu0YxJ7OCiwCijcutpRcqg43XB5FAiSmN6kdEzWjn9HUvkforM2qCr
	817wCcxZxBYtFeIC7dqas8jYXyMeom859TMOgpMoWbxlLV8xV9vHPV0AXYyfzQ==
X-Google-Smtp-Source: AGHT+IGaxQlsWiVI/mJV/nB+Mp2IICAlnHIViegR1Fkm5V0vh3BgrBRwfRrC08WiUB3qWRSrGBNuQA==
X-Received: by 2002:a17:903:234f:b0:1df:f818:8936 with SMTP id c15-20020a170903234f00b001dff8188936mr836476plh.21.1710881932430;
        Tue, 19 Mar 2024 13:58:52 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:f4b6:c22b:c130:6c79])
        by smtp.gmail.com with ESMTPSA id z6-20020a170903018600b001dde2c3fea5sm11800110plg.50.2024.03.19.13.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 13:58:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-tegra@vger.kernel.org,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Douglas Anderson <dianders@chromium.org>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Imre Deak <imre.deak@intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/dp: Clarify that wait_hpd_asserted() is not optional for panels
Date: Tue, 19 Mar 2024 13:58:39 -0700
Message-ID: <20240319135836.v2.1.I521dad0693cc24fe4dd14cba0c7048d94f5b6b41@changeid>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In response to my patch removing the "wait for HPD" logic at the
beginning of the MSM DP transfer() callback [1], we had some debate
about what the "This is an optional function" meant in the
documentation of the wait_hpd_asserted() callback. Let's clarify.

As talked about in the MSM DP patch [1], before wait_hpd_asserted()
was introduced there was no great way for panel drivers to wait for
HPD in the case that the "built-in" HPD signal was used. Panel drivers
could only wait for HPD if a GPIO was used. At the time, we ended up
just saying that if we were using the "built-in" HPD signal that DP
AUX controllers needed to wait for HPD themselves at the beginning of
their transfer() callback. The fact that the wait for HPD at the
beginning of transfer() was awkward/problematic was the whole reason
wait_hpd_asserted() was added.

Let's make it obvious that if a DP AUX controller implements
wait_hpd_asserted() that they don't need a loop waiting for HPD at the
start of their transfer() function. We'll still allow DP controllers
to work the old way but mark it as deprecated.

[1] https://lore.kernel.org/r/20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I would consider changing the docs to say that implementing
wait_hpd_asserted() is actually _required_ for any DP controllers that
want to support eDP panels parented on the DP AUX bus. The issue is
that one DP controller (tegra/dpaux.c, found by looking for those that
include display/drm_dp_aux_bus.h) does populate the DP AUX bus but
doesn't implement wait_hpd_asserted(). I'm actually not sure how/if
this work on tegra since I also don't see any delay loop for HPD in
tegra's transfer() callback. For now, I've left wait_hpd_asserted() as
optional and described the old/deprecated way things used to work
before wait_hpd_asserted().

Changes in v2:
- Make it clear that panels don't need to call if HPD is a GPIO.

 include/drm/display/drm_dp_helper.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index a62fcd051d4d..6c6a96496df6 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -422,7 +422,18 @@ struct drm_dp_aux {
 	 * @wait_hpd_asserted: wait for HPD to be asserted
 	 *
 	 * This is mainly useful for eDP panels drivers to wait for an eDP
-	 * panel to finish powering on. This is an optional function.
+	 * panel to finish powering on. It is optional for DP AUX controllers
+	 * to implement this function. It is required for DP AUX endpoints
+	 * (panel drivers) to call this function after powering up but before
+	 * doing AUX transfers unless the DP AUX endpoint driver knows that
+	 * we're not using the AUX controller's HPD. One example of the panel
+	 * driver not needing to call this is if HPD is hooked up to a GPIO
+	 * that the panel driver can read directly.
+	 *
+	 * If a DP AUX controller does not implement this function then it
+	 * may still support eDP panels that use the AUX controller's built-in
+	 * HPD signal by implementing a long wait for HPD in the transfer()
+	 * callback, though this is deprecated.
 	 *
 	 * This function will efficiently wait for the HPD signal to be
 	 * asserted. The `wait_us` parameter that is passed in says that we
-- 
2.44.0.291.gc1ea87d7ee-goog


