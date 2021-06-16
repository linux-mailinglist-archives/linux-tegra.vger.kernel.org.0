Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82EED3A94AA
	for <lists+linux-tegra@lfdr.de>; Wed, 16 Jun 2021 10:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbhFPIFU (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 16 Jun 2021 04:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232090AbhFPIFT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Jun 2021 04:05:19 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A111C061767
        for <linux-tegra@vger.kernel.org>; Wed, 16 Jun 2021 01:03:14 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id 69so716545plc.5
        for <linux-tegra@vger.kernel.org>; Wed, 16 Jun 2021 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xuN/YJTMYw5vaqPc7yE/QiPRSqEUYMaVwGgpZl3CTtQ=;
        b=AUDmRnDUuYxGz2OMkEcohAlCZTcCUxJVnE8fhYJqlQp5vBSh1t0R3GgjrJsgJoqnax
         M4R9X3S0Oc/CXY8x8bDg66ab+OEHMpeKg/4T7PcEFi2C10lkAhH4NoTbr90ae6tDJAPD
         qp5EQJFGvvEjWvPyocWzlqPEDMN+gJy3J50IwgFeVcZLDXv561Dq6hNqc5raHRVszust
         VwswgIHXmfPADlk9Mxy5y000dLziiZ4ykvbxSbf0ysukYe/fXeKcTvJ8HwjU4ese/qxE
         tAWoa4MbrWDu9FieraFFA27za5TPVKCzFkkdHhjTdixaJX9XdoaZrvMESRhsB2m7o6K9
         D2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xuN/YJTMYw5vaqPc7yE/QiPRSqEUYMaVwGgpZl3CTtQ=;
        b=RtYtrY6QmLzjQ0dWOFHTdJxdMcPt9Gj7SLZi5TUpdAs8pJGrjR8CgqXUiAAhiJGnSO
         S2WLzQnI5wM1AQ3vGbnLGyETM+nPW84qdPWPjKPW3g6QV4E2g5AJQsCasW7FDboESSG8
         RFiUhV+nt7v1ypCFNMrT3n4yoi7Pn0AW9uIUrPl4IpTOmWp+4pejW5joIrGuIYpxIiDY
         JTHq/CV+UA86ft/vUVdwHYiGLIE6a/hOKqsaNQbxPpjupBqqxUQylTYc14SRGWFhYzvm
         1Dbbcd4snj78hTP48vfFYutRbJqV2P/dKb6umRRTVqk4oEm5zF0hCe7u6ddm+ZahwbJ1
         FM7g==
X-Gm-Message-State: AOAM531x5p+eWb8Jug374jvHnjxcUlgc9Gfd5sOGnw49uuXL0Epai/8s
        2RR9cYdESGEAa3n9WaDr4ow2CA==
X-Google-Smtp-Source: ABdhPJx0zeACYKM4/NZ4UymjXASnbHW6zJkS/rS1t/RuEJh3jSW0q4HPJyO7m+AEFVWXKPnYyEdlTw==
X-Received: by 2002:a17:902:e9cb:b029:101:cebc:b8d with SMTP id 11-20020a170902e9cbb0290101cebc0b8dmr7708060plk.5.1623830593685;
        Wed, 16 Jun 2021 01:03:13 -0700 (PDT)
Received: from localhost ([136.185.134.182])
        by smtp.gmail.com with ESMTPSA id b3sm1514124pjz.49.2021.06.16.01.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 01:03:12 -0700 (PDT)
Date:   Wed, 16 Jun 2021 13:33:10 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        vincent.guittot@linaro.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Ion Agorria <ion@agorria.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 4/7] thermal/drivers/tegra: Add driver for Tegra30
 thermal sensor
Message-ID: <20210616080310.vhvauvo5y6m2sekz@vireshk-i7>
References: <20210529170955.32574-1-digetx@gmail.com>
 <20210529170955.32574-5-digetx@gmail.com>
 <6f2b6290-095a-bd39-c160-1616a0ff89b1@linaro.org>
 <20210615102626.dja3agclwzxv2sj4@vireshk-i7>
 <595f5e53-b872-bcc6-e886-ed225e26e9fe@gmail.com>
 <fbdc3b56-4465-6d3e-74db-1d5082813b9c@linaro.org>
 <4c7b23c4-cf6a-0942-5250-63515be4a219@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c7b23c4-cf6a-0942-5250-63515be4a219@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

+Vincent.

On 15-06-21, 22:32, Dmitry Osipenko wrote:
> IIUC, the cpufreq already should be prepared for the case where firmware
> may override frequency. Viresh, could you please clarify what are the
> possible implications of the frequency overriding?

The only implication is software would think hardware is running at
some other frequency, while it is not. Not sure if something may break
as a result of this.

The scheduler's view of CPUs will not be same though, i.e. scheduler
will see capacity as X, while in reality it has changed to Y.

-- 
viresh
