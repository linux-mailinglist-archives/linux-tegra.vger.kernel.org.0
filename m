Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEF120B371
	for <lists+linux-tegra@lfdr.de>; Fri, 26 Jun 2020 16:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgFZOUV (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Fri, 26 Jun 2020 10:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728489AbgFZOUV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Jun 2020 10:20:21 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21D4C03E979
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 07:20:20 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id g20so6849910edm.4
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2020 07:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=UTA7ZcTh9vNdCYkIiavEB8UVtuzNK6oMNczAn/+hcqs=;
        b=UjKmxZk2kMrlrGNxGAC72TQOEQ9wfP4zd4qr1m5xKmirdLS7f1dFdYx+FWKb7hSZA5
         ukVpSNNzv8zRwrfyu9A1KQl3COS18HuY0e1gpgyjFKPs8WdhITnztEOjFv9gopB+Isb7
         TbL3mXrbmmSHMm9mU3Hi8JyrSA1zjepLX5zbpftnE/qVvgx+Ksvy0YUw9fAU1kEnx9+s
         zxSvdAtvoFWBCQjtzHP0pUDLR1Q6qhMT7B++1pn7/mDXAhQGdTP7CZmxhyGiFPLSTOiA
         gvNBsl4PK9JstPkEndT+KjjZzSmFUa2L6VYAEovFj5hNxRojWuEhgh0Pgd4k1phr5nj5
         9X2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=UTA7ZcTh9vNdCYkIiavEB8UVtuzNK6oMNczAn/+hcqs=;
        b=AkTABwZ1XMgWRW3ZBJW/VUl7ghFci/SPN8yOfb5f5UvSPEZBiVBjG/ZgS0Ns1AKcsN
         mmufNhfyDMfr7PG21zRpDlReQbt5xlqYbRtXcqn6EN5vYpgllapzK1ir9fOdLdUpofWm
         V725996BhSIJbPkXNvVzcid9VCVJe7RmAIouGlWP+F4rWZ4OgEvx4IXuscwyUBDEWHWx
         5r0ogjom40/NyxCk6WhVsTTEgi720eNjBx6VRQOKa6jqsO103cr5z2QprmW3T5Rwjggg
         NbcMM7JVdqLfFNXWr+9rU/PGnlPDIgLAJGZJmnRn7fP6wxA5ylmYdNbZSc4eo/Bj/OcU
         ViJA==
X-Gm-Message-State: AOAM5321ScRwGx2Klzyq7tg9GsLXqtGeKheAwjw1wJmI3QRMzgZivupt
        0z4tsg5fFuTnDi3XT7QJGuYiWqp+b7RxHMRGd1YtIJ7s0XMAdQ==
X-Google-Smtp-Source: ABdhPJxlhlcUMTyTr4/lwJDgzu9f3mg6VyjvjpO2PvVNU6nkEuaY5xrFe/BEjGdPdSO6mJiQXT+GO2mOTkY5JeAm4cM=
X-Received: by 2002:a05:6402:7d4:: with SMTP id u20mr3554077edy.30.1593181219196;
 Fri, 26 Jun 2020 07:20:19 -0700 (PDT)
MIME-Version: 1.0
From:   Nicolas Chauvet <kwizart@gmail.com>
Date:   Fri, 26 Jun 2020 16:20:08 +0200
Message-ID: <CABr+WTm79nGMahuudkZtB6nizP8mxwwi6o4r2LUuN8ykoTrONA@mail.gmail.com>
Subject: VDE for tegra124 ?
To:     linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

I'm interested in having at least initial VDE support merged upstream
for tegra124 (not yet tested).
I was wondering if merging the dts part and the needed compatible
along with few fixes (2) would be enough to work with the current
userspace ? (libvdpau-tegra)

I plan to have it tried after 5.18-rc3 land and report.

Thanks for your advice.

(1) https://github.com/thierryreding/linux/commits/for-4.22/vde
(2) currently testing patches:
ae8cd25401f9 ARM: tegra: Enable SMMU for VDE on Tegra124
53e4822d773a staging: media: tegra-vde: Keep VDE in reset when unused
eb5b12a86651 staging: media: tegra-vde: Print out invalid FD
c28810efcb90 staging: media: tegra-vde: Support BSEV clock and reset
55266929b386 staging: media: tegra-vde: Properly mark invalid entries
3aae01ea407f ARM: tegra: Add BSEV clock and reset for VDE on Tegra30
f5e6a834c766 ARM: tegra: Add BSEV clock and reset for VDE on Tegra20
615bf7bab259 ARM: tegra: Enable VDE on Tegra124

-- 
-

Nicolas (kwizart)
